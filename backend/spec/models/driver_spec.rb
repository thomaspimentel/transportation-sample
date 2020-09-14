require 'rails_helper'

RSpec.describe Driver, type: :model do
  it 'is invalid because first name is not present' do
    driver = build(:driver, first_name: nil)
    expect(driver).to_not be_valid
  end

  it 'is invalid because last name is not present' do
    driver = build(:driver, last_name: nil)
    expect(driver).to_not be_valid
  end

  it 'is invalid because email is not present' do
    driver = build(:driver, email: nil)
    expect(driver).to_not be_valid
  end

  it 'email must be unique' do
    create :driver
    driver = build :driver
    expect(driver).to_not be_valid
  end

  it 'has a full name method' do
    expect(build(:driver)).to respond_to(:full_name)
  end
end
