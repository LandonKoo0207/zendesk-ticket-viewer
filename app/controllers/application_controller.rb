class ApplicationController < ActionController::Base
  rescue_from StandardError, :with => :error_response

  def error_response(error)
    redirect_to errors_path(code: error.status)
  end
end
