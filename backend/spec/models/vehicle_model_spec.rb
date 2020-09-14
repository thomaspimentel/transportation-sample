require 'rails_helper'

RSpec.describe VehicleModel, type: :model do
  it "is invalid without name present" do
    vehicle_model = build(:vehicle_model, name: nil)
    expect(vehicle_model).to_not be_valid
  end

  it { is_expected.to belong_to(:vehicle_make)}
end
