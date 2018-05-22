class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_acces_point

  private

  # Check for valid request token and return user
  def authorize_request
    @current_acces_point = (AuthorizeApiRequest.new(request.headers).call)[:acces_point]
  end
end
