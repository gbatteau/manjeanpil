class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  geocoded_by :address, latitude: :latitude, longitude: :longitude
  after_validation :geocode

  def address
    [street, city, state, zipcode].compact.join(', ')
  end
end
