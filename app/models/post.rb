class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def address
    [street, city, state, zipcode].compact.join(', ')
  end
end
