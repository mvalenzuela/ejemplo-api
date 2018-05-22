class AuthenticateAccesPoint
  def initialize(ip, password)
    @ip = ip
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(acces_point_id: acces_point.id) if acces_point
  end

  private

  attr_reader :ip, :password

  # verify user credentials
  def acces_point
    acces_point = AccesPoint.find_by(ip: ip)
    return acces_point if acces_point && acces_point.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
