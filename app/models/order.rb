class Order < ApplicationRecord

  belongs_to :user
  has_many :positions
  has_many :products, through: :positions

  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = self.user.name.to_s.parameterize + "order" + self.id
  end
end
