class ApplicationController < ActionController::API
  before_filter :validate_request_format, except: [:index]

  private

  def validate_request_format
    raise unless request.format == 'application/vnd.api+json'
  end
end
