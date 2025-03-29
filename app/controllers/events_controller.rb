class EventsController < ApplicationController
  def index
    @events = CentreEvent.all.order(:date)
  end
end
