require 'rails_helper'

RSpec.describe VehicleMake, type: :model do
  it 'is invalid without name present' do
    vehicle_make = build :vehicle_make, name: nil
    expect(vehicle_make).to_not be_valid
  end
end
