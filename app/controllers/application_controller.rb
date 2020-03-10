class ApplicationController < ActionController::Base
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # add_flash_types :info, :error, :warning


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :date_of_birth, :profile, :captain, :gender, :photo])
  end
end
