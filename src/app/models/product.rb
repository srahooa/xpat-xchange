class Product < ApplicationRecord
  belongs_to :user

  validates :product_name, presence: true
  validates :price, presence: true, numericality: true 
end
