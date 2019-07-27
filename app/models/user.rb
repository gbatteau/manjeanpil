class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_one :profile
  
  # current_sign_in_ip
  #geocoded_by :current_sign_in_ip, :latitude => :lat, :longitude => :long
  #after_validation :geocode
  
  
  #ip look up added gb
  
  geocoded_by :ip_lookup
  after_validation :geocode
  
    def ip_lookup
    ip = Thread.current[:request].remote_ip
    if ip == '127.0.0.1' || ip == '::1'
      '70.184.119.26'
    else
      ip
    end
  end
end
