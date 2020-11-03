class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(title: params[:title], duration: params[:duration], start_date: params[:start_date], price: params[:price], location: params[:location], description: params[:description], user: current_user)
    if @event.save 
      redirect_to root_path
    else
      render :new
    end
  end

  # def destroy
  # end

  def show
    id = params[:id]
    @event = Event.find(id)
  end

  def index
    @events = Event.all
  end

  # def edit
  # end

  # def update
  # end
end
