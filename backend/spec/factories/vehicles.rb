# spec/factories/events.rb
FactoryBot.define do
    factory :vehicle do
        username        { "ten_tour_01" }
        year            { 1998 }
        license         { "ABC 1234" }
        color           { "Blue" }
        rider_capacity  { 3 }
        event     {association :event, name: "Event for driver"}

        trait :is_active do
            status { :active }
        end

        trait :is_inactive do
            status { :inactive }
        end

        trait :is_deleted do
            status { :deleted }
        end
    end
end