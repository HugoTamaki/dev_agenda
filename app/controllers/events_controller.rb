class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    now = DateTime.now
    @events = Event.by_month(now.month)
      .map {|event| {title: event.name, 
                     start: event.date.strftime('%Y-%m-%d'),
                     end: event.end_date.strftime('%Y-%m-%d'),
                     url: "events/#{event.id}"}}
  end

  def new
    @event = Event.new
    @event.build_address
  end

  def show
    
  end

  def edit

  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Evento criado com sucesso!.' }
        format.json { render :show, status: :created, location: @events }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params["event"]["date"] = format_date(params["event"]["date"])
    params.require(:event).permit(
      :name,
      :date,
      :description,
      address_attributes: [
        :id,
        :street, 
        :state,
        :city,
        :district, 
        :number, 
        :coordinates_x, 
        :coordinates_y,
        :event_id
      ])
  end

  def format_date(date)
    date_arr = date.split("/")
    "#{date_arr[2]}-#{date_arr[1]}-#{date_arr[0]}".to_datetime
  end
end
