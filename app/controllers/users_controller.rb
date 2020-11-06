class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_right_user

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

  def edit
    
  end
  def update
    post_params = params.require(:user).permit(:first_name, :last_name, :description, :email, :password)
    current_user.update(post_params)
    if current_user.update(post_params)
      sign_in(current_user, :bypass => true)
      redirect_to root_path
    else
      render :edit
    end
  end
end
