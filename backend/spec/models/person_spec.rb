require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'is invalid because first name is not present' do
    person = build(:person, first_name: nil)
    expect(person).to_not be_valid
  end

  it 'is invalid because last name is not present' do
    person = build(:person, last_name: nil)
    expect(person).to_not be_valid
  end

  it 'is invalid because email is not present' do
    person = build(:person, email: nil)
    expect(person).to_not be_valid
  end

  it 'email must be unique' do
    create :person
    person = build :person
    expect(person).to_not be_valid
  end
end
