class Admins::AdminsController < ApplicationController
  def index
    @events = Event.all
    @users = User.all
  end
end
