class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # defines relationship to User. Allows for one attached image (cloudinary)

  # required fields to create a new product. price must be numeric
  validates :product_name, presence: true
  validates :current_country, presence: true
  validates :price, presence: true, numericality: true 


end
