class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders
  has_one :cart


  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :confirmable, :validatable

  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = self.name.to_s.parameterize
  end
end
