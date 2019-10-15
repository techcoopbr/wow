class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo, :role_id, :about, :facebook, :twitter, :twitch, :website, :podcast, :page_name, :page_create])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :photo, :role_id, :about, :facebook, :twitter, :twitch, :website, :podcast, :page_name, :page_create])
  end

  private

  def user_not_authorized
    redirect_to panel_index_path
  end

  def forbidden(exception)
    render text: exception.message
  end
end
