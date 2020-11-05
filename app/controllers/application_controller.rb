class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    divise_parameter_sanitizer.permit(:sign_up, key: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])

end
