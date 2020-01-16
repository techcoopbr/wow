class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo, :role_id, :about, :facebook, :twitter, :twitch, :website, :podcast, :page_name, :page_create, :youtube, :intagram])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :photo, :role_id, :about, :facebook, :twitter, :twitch, :website, :podcast, :page_name, :page_create, :youtube, :intagram])
  end

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  end

  def after_sign_in_path_for(resource)
    panel_index_path
  end

  private

  def render_error(status, exception)
    Rails.logger.error status.to_s + " " + exception.message.to_s
    Rails.logger.error exception.backtrace.join("\n")
    respond_to do |format|
      format.html { render template: "errors/error_#{status}",status: status }
      format.all { render nothing: true, status: status }
    end
  end

  def user_not_authorized
    redirect_to panel_index_path
  end

  def forbidden(exception)
    render text: exception.message
  end
end
