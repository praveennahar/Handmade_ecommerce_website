class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :category
    has_many :products
    has_many :cart_items
    belongs_to :account
    has_many :cart_items,dependent: :destroy
end
