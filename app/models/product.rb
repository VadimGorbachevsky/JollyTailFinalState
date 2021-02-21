class Product < ApplicationRecord

  validates :name, length: { maximum: 100,
   too_long: "Наименование не должно превышать 100 символов" }

  belongs_to :category
  belongs_to :accia

  has_one :productcount

  has_many :positions
  has_many :carts, through: :positions
  has_many :orders, through: :positions

  has_many_attached :images, dependent: false

  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = self.name.to_s.parameterize
  end

end
