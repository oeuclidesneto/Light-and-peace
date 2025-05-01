class QuarterlyReport < ApplicationRecord
  has_one_attached :pdf

  validates :quarter, presence: true
  validates :year, presence: true
  validates :recyclables, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :canteen, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :donations, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :pdf, presence: true
  validates :slug, uniqueness: true
  validates :admin_notes, length: { maximum: 500 }, allow_blank: true

  before_validation :generate_slug

  def generate_slug
    if quarter.present? && year.present?
      self.slug = "#{quarter.downcase}-#{year}"
    end
  end

  def to_param
    slug
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[quarter year recyclables canteen donations created_at updated_at]
  end
end
