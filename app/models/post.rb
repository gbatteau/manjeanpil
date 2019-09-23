class User < ApplicationRecord
    has_many :posts, dependent: :destroy
end

class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  
  geocoded_by :address, :latitude => :lat, :longitude => :long
  after_validation :geocode, :if => :address_changed?
  
  def address
    [street, city, state, zipcode].compact.join(', ')
  end
  
  #gb adding Category type
  SPECIAL_TYPES = ["Lunch", "Happy-Hour", "Dinner"]
end
