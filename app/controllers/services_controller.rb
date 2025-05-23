class ServicesController < ApplicationController
  helper ActionView::Helpers::TextHelper
  def index
    @services = Service.all  # Fetch all services
  end
  def show
    @service = Service.find_by!(slug: params[:id])
    if @service.title.downcase == "study group"
      @books = Book.order(:position)
      @current_book = @books.find(&:current)
    end
  end
end
