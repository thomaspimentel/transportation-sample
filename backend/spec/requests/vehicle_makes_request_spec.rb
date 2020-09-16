require 'rails_helper'

RSpec.describe "VehicleMakes", type: :request do
    before(:each) do
        @headers = { "ACCEPT": "application/json"}
    end

    let(:valid_attributes) {
        build(:vehicle_make).attributes
    }

    let(:invalid_attributes) {
        build(:vehicle_make, name: nil).attributes
    }

    describe "GET /index" do
        it "renders a successful response" do
            vehicle_make = create :vehicle_make
            get vehicle_makes_url, headers: @headers
            expect(response).to be_successful
        end
    end

    describe "POST /create" do
        context "with valid attributes" do
            it "creates a new vehicle_make" do
                expect {
                    post vehicle_makes_url, params: {
                        vehicle_make: valid_attributes
                    }
                }.to change(VehicleMake.all, :count).by(1)
            end
        end

        context "with invalid attributes" do
            it "does not create a new vehicle_make" do
                expect {
                    post vehicle_makes_url, params: {
                        vehicle_make: invalid_attributes
                    }
                }.to change(VehicleMake, :count).by(0)
            end
        end
    end

    describe "GET /show" do
        it "returns a succesful response" do
            vehicle_make = create :vehicle_make
            get vehicle_make_url(vehicle_make)
            expect(response).to be_successful
        end
    end

    describe "PATCH /update" do
        context "with valid attributes" do
            let(:new_attributes) {
                build(:vehicle_make, name: "new vehicle_make name").attributes
            }

            it "updates the requested vehicle_make" do
                vehicle_make = create :vehicle_make
                patch vehicle_make_url(vehicle_make), params: { vehicle_make: new_attributes }
                vehicle_make.reload
                expect(response).to be_successful
                expect(JSON.parse(response.body)["name"]).to eq(new_attributes["name"])
            end
        end

        context "with invalid attributes" do
            let(:new_attributes) {
                build(:vehicle_make, name: "").attributes
            }

            it "does not update the requested vehicle_make" do
                vehicle_make = create :vehicle_make
                patch vehicle_make_url(vehicle_make), params: {vehicle_make: new_attributes}
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end

    describe "DELETE /destroy" do
        it "destroys the requested vehicle_make" do
            vehicle_make = create :vehicle_make
            expect {
                delete vehicle_make_url(vehicle_make)
            }.to change(VehicleMake, :count).by(-1)
            expect(response.body).to be_empty
        end
    end
end
