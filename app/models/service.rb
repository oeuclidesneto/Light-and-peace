class Service < ApplicationRecord
  before_save :generate_slug

  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :full_description, presence: true

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = title.parameterize if will_save_change_to_title? || slug.blank?
  end
end
