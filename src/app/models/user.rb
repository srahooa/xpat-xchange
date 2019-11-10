class User < ApplicationRecord
# Devise creates a User and here a role is connected via Rolify
# Products belong to User 
  rolify
  after_create :assign_default_role

  has_many :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_default_role
    add_role(:user) if roles.blank?
  end

end
