class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    def create
      @event = Event.create('title' => params[:title], 'duration'=> params[:duration], 'start_date'=> params[:start_date], 'price'=> params[:price], 'location'=> params[:location], 'description'=> params[:description], 'user' => current_user)
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
