class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def dashboard
    # Ensure @posts is set to display posts on the dashboard
    @posts = Post.all
  end

  private

  def check_admin
    # You may want to add logic to restrict access to admin users
    redirect_to root_path unless current_user.admin?
  end
end
