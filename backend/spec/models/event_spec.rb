require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'is invalid with name not present' do
    event = build :event, name: nil
    expect(event).to_not be_valid
  end

  it 'is invalid because name is not unique' do
    event1 = create :event
    event2 = build :event
    expect(event2).to_not be_valid
  end

  it 'is invalid because start_date does not exist' do
    event = build :event, start_date: nil
    expect(event).to_not be_valid
  end

  it 'is invalid because end_date is before start_date' do
    event = build :event, start_date: "2020-01-02", end_date: "2020-01-01"
    expect(event).to_not be_valid
  end
end
