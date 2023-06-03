class Cart < ApplicationRecord
  belongs_to :account
  has_many :cart_items
  belongs_to :order
end
