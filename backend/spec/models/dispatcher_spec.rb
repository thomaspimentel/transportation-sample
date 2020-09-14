require 'rails_helper'

RSpec.describe Dispatcher, type: :model do
  it 'is invalid because first name is not present' do
    dispatcher = build(:dispatcher, first_name: nil)
    expect(dispatcher).to_not be_valid
  end

  it 'is invalid because last name is not present' do
    dispatcher = build(:dispatcher, last_name: nil)
    expect(dispatcher).to_not be_valid
  end

  it 'is invalid because email is not present' do
    dispatcher = build(:dispatcher, email: nil)
    expect(dispatcher).to_not be_valid
  end

  it 'email must be unique' do
    create :dispatcher
    dispatcher = build :dispatcher
    expect(dispatcher).to_not be_valid
  end

  it 'has a full name method' do
    expect(build(:dispatcher)).to respond_to(:full_name)
  end

  it 'has a role' do
    expect(build(:rider).attributes).to include("rider_type")
  end

  it { should enumerize(:dispatcher_role) }
end
