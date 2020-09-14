# spec/factories/people.rb
FactoryBot.define do
    factory :vehicle_make do
        name { "Honda" }
        
        trait :is_active do
            active { true }
        end

        trait :is_inactive do
            active { false } 
        end
    end
end