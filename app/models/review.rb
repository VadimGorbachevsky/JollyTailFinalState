class Review < ApplicationRecord

  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = title.to_s.parameterize
  end 

end
