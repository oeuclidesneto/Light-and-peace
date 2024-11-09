class AdminController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]  # Only authenticate for dashboard action
  before_action :require_admin, only: [:dashboard]  # Only check if admin for the dashboard

  def dashboard
    # Admin-only content goes here
  end

  private

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "You must be an admin to access this page."
    end
  end
end
