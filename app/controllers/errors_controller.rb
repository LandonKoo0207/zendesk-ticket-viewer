class ErrorsController < ApplicationController
  def errors
    @error_code = params[:code]
    @error_page = error_page(@error_code)
  end

  def error_page(error_code)
    case error_code
    when "200"
      "invalid_response"
    when "401"
      "could_not_authenticate"
    when "404"
      "not_found"
    when "routing_error"
      "routing_error"
    else
      'unknown_error'
    end
  end
end
