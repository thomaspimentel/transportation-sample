require 'rails_helper'
# WORK HERE NEXT

RSpec.describe Vehicle, type: :model do
  it 'is valid' do
    vehicle = build :vehicle

    expect(vehicle).to be_valid
  end

  it 'is invalid without username present' do
    vehicle = build :vehicle, username: nil
    expect(vehicle).to_not be_valid
  end

  it 'is still valid without a year value' do
    vehicle = build :vehicle, year: nil
    expect(vehicle).to be_valid
  end

  it 'is invalid if year attr outside of 1900-2099 range' do
    vehicle1 = build :vehicle, year: 1899
    vehicle2 = build :vehicle, year: 2100

    expect(vehicle1).to_not be_valid
    expect(vehicle2).to_not be_valid
  end
end
