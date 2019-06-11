class ApplicationController < ActionController::Base
  rescue_from StandardError, :with => :error_response

  def error_response(error)
    redirect_to errors_path(code: error.status)
  end

  def route_not_found
    redirect_to errors_path(code: 'routing_error')
  end
end
