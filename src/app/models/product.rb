class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :price, presence: true, numericality: true 

 


end
