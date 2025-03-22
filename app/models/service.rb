class Service < ApplicationRecord
  before_save :generate_slug

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = title.parameterize if title.present? && slug.blank?
  end
end
