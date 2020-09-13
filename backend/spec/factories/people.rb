# spec/factories/people.rb
FactoryBot.define do
    factory :person, class: "Person" do
        first_name      {"Thomas"}
        last_name       {"Pimentel"}
        email           {"thomas@webscaping.ca"}
        date_of_birth   {"1940-05-06"}
        phone_number    {"647-300-1486"}
    end

    factory :rider, class: "Rider" do
        first_name      {"Anon"}
        last_name       {"Rider"}
        email           {"anon_rider@tennistournament.com"}
        date_of_birth   {"2000-05-04"}
        phone_number    {"123-456-7890"}
    end

    factory :driver, class: "Driver" do
        first_name      {"Anon"}
        last_name       {"Driver"}
        email           {"anon_driver@tennistournament.com"}
        date_of_birth   {"1960-08-03"}
        phone_number    {"098-765-4321"}
        event
    end

    factory :dispatcher, class: "Dispatcher" do
        first_name      {"Anon"}
        last_name       {"Dispatcher"}
        email           {"anon_disptcher@tennistournament.com"}
        date_of_birth   {"1965-09-23"}
        phone_number    {"098-765-1234"}

        trait :superadmin do
            dispatcher_role { "superadmin" }
        end

        trait :dispatcher do
            dispatcher_role { "dispatcher" }
        end
    end
end 