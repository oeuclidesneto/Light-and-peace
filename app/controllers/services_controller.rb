class ServicesController < ApplicationController
  def index
    @services = Service.all  # Fetch all services
  end
  def show
    @service = Service.find_by!(slug: params[:id])
  end
end
