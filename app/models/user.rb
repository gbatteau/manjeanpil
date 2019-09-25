class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_one :profile
  has_many :posts, dependent: :destroy

  geocoded_by :ip_lookup, :latitude => :lat, :longitude => :long
  after_validation :geocode

  private

  def ip_lookup
    ip = Thread.current[:request].try(:remote_ip)

    if ip == '127.0.0.1' || ip == '::1'
      '169.254.187.96'
    else
      ip
    end
  end
end
