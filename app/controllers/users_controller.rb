class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    id = params[:id]
    @user = User.find(params[:id])
  end

  def index
  end
end
