class EventsController < ApplicationController
  def index
    @events = CentreEvent.where('date > ?', Time.current).order(:date)
  end
end
