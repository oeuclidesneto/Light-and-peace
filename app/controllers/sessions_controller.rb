class SessionsController < ApplicationController
  def new
  end

  def create
    @admin = Admin.find_by(username: params[:username])
    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to posts_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid credentials'
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: 'Logged out successfully'
  end
end
