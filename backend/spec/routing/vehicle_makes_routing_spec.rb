require "rails_helper"

RSpec.describe VehicleMakesController, type: :routing do
    describe "vehicle_make routing" do
        it "routes to #index" do
            expect(get: "/vehicle_makes").to route_to("vehicle_makes#index")
        end
        it "routes to #show" do
            expect(get: "/vehicle_makes/1").to route_to("vehicle_makes#show", id: "1")
        end
        it "routes to #create" do
            expect(post: "/vehicle_makes").to route_to("vehicle_makes#create")
        end
        it "routes to #update" do
            expect(patch: "/vehicle_makes/1").to route_to("vehicle_makes#update", id: "1")
        end
        it "routes to #destroy" do
            expect(delete: "/vehicle_makes/1").to route_to("vehicle_makes#destroy", id: "1")
        end
    end
end