class AccesPoint < ApplicationRecord
  has_secure_password
  belongs_to :bus_stop
  validates_presence_of :bus_stop_id, :password_digest, :ip
end
