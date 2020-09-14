require 'rails_helper'

RSpec.describe "/events/:event_id/drivers", type: :request do
    before(:each) do
        @headers = { "ACCEPT" => "application/json" }
        @event = create :event
    end

    let(:valid_attributes) {
        build(:driver).attributes
    }

    let(:invalid_attributes) {
        build(:driver, first_name: nil, last_name: nil).attributes
    }

    describe "GET /index" do
        it "renders a successful response" do
            @event.drivers.create! valid_attributes
            get event_drivers_url(@event), headers: @headers
            expect(response).to be_successful
        end
    end

    describe "POST /create" do
        context "with valid attributes" do
            it "creates a new driver for event" do
                expect {
                    post event_drivers_url(@event), params: { driver: valid_attributes }, headers: @headers
                }.to change(@event.drivers, :count).by(1)
            end

            it "responds with created driver" do
                post event_drivers_url(@event), params: { driver: valid_attributes }, headers: @headers
                expect(JSON.parse(response.body)["email"]).to eq(valid_attributes["email"])
            end
        end
    end
end
