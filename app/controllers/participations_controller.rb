class ParticipationsController < ApplicationController
  def index
    @participations = Participation.all.find_all{|participation| participation.event_id == params[:event_id]}
    @id_edit_event_path = params[:event_id]
  end
  def create
    @participation = Participation.new(event_id: params[:event_id], user_id: current_user.id)
    if @participation.save 
      redirect_to event_path(@participation.event.id)
    else
      redirect_to root_path
    end
  end
end
