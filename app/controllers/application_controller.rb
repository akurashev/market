class ApplicationController < ActionController::Base
  before_action :http_authenticate

  private

  def http_authenticate
    return true unless Rails.env.production?

    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.http_auth[:user] &&
        password == Rails.application.credentials.http_auth[:password]
    end
  end
end
