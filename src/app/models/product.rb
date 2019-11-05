class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :price, presence: true, numericality: true 

  def can_edit?(user)
    return user == self.user || user.has_role?(:admin)
  end


end
