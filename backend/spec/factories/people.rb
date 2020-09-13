# spec/factories/people.rb
FactoryBot.define do
    factory :person, class: "Person" do
        first_name      {"Thomas"}
        last_name       {"Pimentel"}
        email           {"thomas@webscaping.ca"}
        date_of_birth   {"1940-05-06"}
        phone_number    {"647-300-1486"}
    end
end 