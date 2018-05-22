class Bus < ApplicationRecord
  validates_presence_of :route, :arrival_estimation
end
