class EventsController < ApplicationController
  before_action :is_admin?, only: [:destroy, :edit, :update]


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

  def show
    id = params[:id]
    @event = Event.find(id)
    @end_date = @event.start_date + @event.duration*60
    if current_user
      @participation = @event.participations.find_by(user_id: current_user[:id], event_id: @event.id)
    end
    if current_user == @event.user
    @admin = @event.user
    end
  end

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    post_params = params.permit(:title, :description, :price, :start_date, :location, :duration, user_id: current_user.id)

      @event.update(post_params)
      if @event.update(post_params)
        redirect_to event_path(@event.id)
      else
        render :edit
      end
    
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private

  def is_admin?
    @event = Event.find(params[:id])
    unless current_user.id == @event.user_id 
      redirect_to root_path
    end
  end

end
