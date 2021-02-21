class Position < ApplicationRecord

  validates :quantity, presence: true, numericality: { greater_than: 0, less_than: 100 }

  belongs_to :product
  belongs_to :cart
  belongs_to :order
end
