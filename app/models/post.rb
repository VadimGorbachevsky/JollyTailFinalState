class Post < ApplicationRecord

  def to_param
    "#{id}-#{slug}"
  end


  private

  def set_slug
    self.slug = self.title.to_s.parameterize
  end
end
