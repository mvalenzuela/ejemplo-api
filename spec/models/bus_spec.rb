require 'rails_helper'

RSpec.describe Bus, type: :model do
  it { should validate_presence_of(:route) }
  it { should validate_presence_of(:arrival_estimation) }
end
