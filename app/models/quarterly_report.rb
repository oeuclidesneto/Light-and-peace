class QuarterlyReport < ApplicationRecord
  has_one_attached :pdf

  before_validation :generate_slug
  validates :slug, uniqueness: true

  def generate_slug
    if quarter.present? && year.present?
      self.slug = "#{quarter.downcase}-#{year}"
    end
  end

  def to_param
    slug
  end
end
