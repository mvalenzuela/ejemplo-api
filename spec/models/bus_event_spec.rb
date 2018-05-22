require 'rails_helper'

RSpec.describe BusEvent, type: :model do
  it { should validate_presence_of(:plate_code) }
  it { should validate_presence_of(:speed) }
end
