class Pricelist < ApplicationRecord
    has_one_attached :image, dependent: false
end