class ApplicationController < ActionController::Base
  protect_from_forgery

  http_basic_authenticate_with unless: ->(c) {
      # TODO by rails config Rails.configuration.authentication['name']
      ENV['ADMIN_BASIC_AUTH_PASSWORD'].blank? ||
      (request.get? && c.action_name != 'new' && c.action_name != 'edit')
    },
    name: ENV['ADMIN_BASIC_AUTH_NAME'],
    password: ENV['ADMIN_BASIC_AUTH_PASSWORD']

  # def admin_authenticate
  # end
end
