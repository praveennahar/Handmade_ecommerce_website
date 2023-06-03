class Account < ApplicationRecord
  # has_and_belongs_to_many :roles, join_table: :accounts_roles
  
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  
  has_many :carts
  has_many :cart_items
  has_many :products
  has_many :orders
       
end
