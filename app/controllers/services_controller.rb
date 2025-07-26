class ServicesController < ApplicationController
  helper ServicesHelper

  def index
    @services = Service.all
  end

  def study_group
    @books = Book.order(:position)
    @current_book = @books.find(&:current)
  end

  def gospel_at_home; end
  def fraternal_assistance; end
  def children_and_youth_group; end
  def energy_healing; end
  def library; end
  def lecture; end
end
