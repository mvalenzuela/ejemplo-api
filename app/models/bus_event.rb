class BusEvent < ApplicationRecord
  validates_presence_of :plate_code, :speed
end
