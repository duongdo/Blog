class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  include LikesHelper

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :account_update, keys: [:avatar]
  end
end
