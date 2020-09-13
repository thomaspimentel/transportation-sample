# spec/factories/events.rb
FactoryBot.define do
    factory :event do
        trait :is_active do
            active { true }
        end

        trait :is_inactive do
            active { false }
        end

        name        { "The Tennis Event" }
        start_date  { "2021-02-28"}
        end_date    { "2021-03-14"}

        factory :active_event,      traits: [:is_active]
        factory :inactive_event,    traits: [:is_inactive]
    end
end 