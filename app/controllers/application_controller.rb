class ApplicationController < ActionController::Base
  # Basic認証
  before_action :basic_auth
  # //Basic認証

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
  # //Basic認証

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:encrypted_password, :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthdate, :'birthdate(1i)',
                                             :'birthdate(2i)', :'birthdate(3i)'])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:encrypted_password])
  end
end
