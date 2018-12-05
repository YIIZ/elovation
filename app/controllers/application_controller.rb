class ApplicationController < ActionController::Base
  protect_from_forgery

  http_basic_authenticate_with unless: -> { ENV['ADMIN_BASIC_AUTH_PASSWORD'].blank? || request.get? },
    name: ENV['ADMIN_BASIC_AUTH_NAME'],
    password: ENV['ADMIN_BASIC_AUTH_PASSWORD']

  # def admin_authenticate
  # end
end
