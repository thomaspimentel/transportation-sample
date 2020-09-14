# spec/factories/events.rb
FactoryBot.define do
    factory :vehicle_model do
        name { "Civic" }
        vehicle_make
    end
end