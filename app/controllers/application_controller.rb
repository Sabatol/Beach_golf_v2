class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if:  :devise_controller?

  def is_free?(event)
    event.price == 0
  end
  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

  end

  private

  def is_right_user
    unless current_user == User.find(params[:id])
      redirect_to root_path
    end
  end
end
