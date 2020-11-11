class Admins::EventsController < ApplicationController
  def show
  end
  
  def index
    @events = Event.all
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admins_root_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    post_params = params.permit(:title, :description, :price, :start_date, :location, :duration, user_id: current_user.id)

      @event.update(post_params)
      if @event.update(post_params)
        redirect_to admins_root_url
      else
        render :edit
      end
    
  end
end
