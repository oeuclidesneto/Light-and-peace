class CentreEvent < ApplicationRecord
  # Add this method
  def self.ransackable_attributes(auth_object = nil)
    %w[title date description location icon created_at updated_at]
  end
end
