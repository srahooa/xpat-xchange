class Order < ApplicationRecord
  belongs_to :user
  has_many :products
end
# defines relationship to User and Product