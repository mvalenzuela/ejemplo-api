class AccesPointsController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    acces_point = AccesPoint.create!(acces_point_params)
    auth_token = AuthenticateAccesPoint.new(acces_point.ip, acces_point.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def acces_point_params
    params.permit(
      :bus_stop_id,
      :ip,
      :mac,
      :password,
      :password_confirmation
    )
  end
end
