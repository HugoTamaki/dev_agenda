class EventsController < ApplicationController
  def index

  end

  def new
    @event = Event.new
    @event.build_address
  end

  def edit

  end

  def create

  end
end
