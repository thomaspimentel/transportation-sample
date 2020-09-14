10.times do |n|
    Event.create({
        name: "Event ##{n}",
        start_date: "2020-01-01",
        end_date: "2020-01-08",
        address: "1234 Street Name Rd",
        city: "Indian Wells",
        state: "California",
        postal_code: "54353",
        country: "US",
    })
end