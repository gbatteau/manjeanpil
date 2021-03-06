class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_request_in_thread

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:stripe_card_token, :email, :password, :password_confirmation)
      end
    end

    def store_request_in_thread
      Thread.current[:request] = request
    end
end
