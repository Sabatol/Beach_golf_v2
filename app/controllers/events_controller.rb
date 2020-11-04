class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(title: params[:title], duration: params[:duration], start_date: params[:start_date], price: params[:price], location: params[:location], description: params[:description], user: current_user)
    if @event.save 
      redirect_to event_path(@event.id)
    else
      redirect_to new_event_path
    end
  end

  # def destroy
  # end

  def show
    id = params[:id]
    @event = Event.find(id)
    @end_date = @event.start_date + @event.duration*60
  end

  def index
    @events = Event.all
  end

  # def edit
  # end

  # def update
  # end
end
