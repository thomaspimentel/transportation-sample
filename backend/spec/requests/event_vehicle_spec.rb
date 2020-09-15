require 'rails_helper'

RSpec.describe "Vehicles", type: :request do
    before(:each) do
        @headers = { "ACCEPT": "application/json"}
        @event = create :event
    end

    let(:valid_attributes) {
        build(:vehicle).attributes
    }

    let(:invalid_attributes) {
        build(:vehicle, username: nil).attributes
    }

    describe "GET /index" do
        it "renders a successful response" do
            @event.vehicles.create! valid_attributes
            get event_vehicles_url(@event), headers: @headers
            expect(response).to be_successful
        end
    end

    describe "POST /create" do
        context "with valid attributes" do
            it "create a new vehicle for event" do
                expect {
                    post event_vehicles_url(@event), params: { vehicle: valid_attributes }
                }.to change(@event.vehicles, :count).by(1)
            end
        end

        context "with invalid attributes" do
            it "does not create a new vehicle for event" do
                expect {
                    post event_vehicles_url(@event), params: { vehicle: invalid_attributes }
                }.to change(@event.vehicles, :count).by(0)
            end
        end
    end
end
