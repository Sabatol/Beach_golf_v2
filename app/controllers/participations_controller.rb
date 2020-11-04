class ParticipationsController < ApplicationController
  def index
    @participations = Participation.all.find_all{|participation| participation.event_id == params[:event_id]}
    @id_edit_event_path = params[:event_id]
  end
end
