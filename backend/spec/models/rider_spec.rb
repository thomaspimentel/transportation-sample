require 'rails_helper'

RSpec.describe Rider, type: :model do
  it 'is invalid because first name is not present' do
    rider = build(:rider, first_name: nil)
    expect(rider).to_not be_valid
  end

  it 'is invalid because last name is not present' do
    rider = build(:rider, last_name: nil)
    expect(rider).to_not be_valid
  end

  it 'is invalid because email is not present' do
    rider = build(:rider, email: nil)
    expect(rider).to_not be_valid
  end

  it 'email must be unique' do
    create :rider
    rider = build :rider
    expect(rider).to_not be_valid
  end

  it 'has a full name method' do
    expect(build(:rider)).to respond_to(:full_name)
  end

  it 'has a rider type' do
      expect(build(:rider).attributes).to include("rider_type")
  end

  it { should enumerize(:rider_type) }
end
