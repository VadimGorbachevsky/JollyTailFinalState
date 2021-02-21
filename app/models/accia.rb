class Accia < ApplicationRecord

  has_many :products

  has_one_attached :image


  def to_param
    "#{id}-#{slug}"
  end
  
end
