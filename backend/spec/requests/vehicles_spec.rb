require 'rails_helper'

RSpec.describe "/vehicles", type: :request do
    describe "GET /show" do
        it "returns a successful response" do
            vehicle = create :vehicle
            get vehicle_url(vehicle)
            expect(response).to be_successful
        end
    end

    describe "PATCH /update" do
        context "with valid parameters" do
            let(:new_attributes) {
                build(:vehicle, username: "new_user").attributes
            }

            it "updates the requested vehicle" do
                vehicle = create :vehicle
                patch vehicle_url(vehicle), params: { vehicle: new_attributes }
                vehicle.reload
                expect(JSON.parse(response.body)["username"]).to eq(new_attributes["username"])
            end
        end

        context "with invalid parameters" do
            let(:new_attributes) {
                build(:vehicle, username: "new user").attributes
            }

            it "does not update the requested vehicle" do
                vehicle = create :vehicle
                patch vehicle_url(vehicle), params: { vehicle: new_attributes }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end

    describe "DELETE /destroy" do
        it "destroys the requested vehicle" do
            vehicle = create :vehicle
            expect {
                delete vehicle_url(vehicle)
            }.to change(Vehicle, :count).by(-1)
        end

        it "expects an empty response body" do
            vehicle = create :vehicle
            delete vehicle_url(vehicle)
            expect(response.body).to be_empty
        end
    end
end