require "rails_helper"

RSpec.describe VehiclesController, type: :routing do
    describe "nested event routing" do
        it "routes to #index" do
            expect(get: "/events/1/vehicles").to route_to("vehicles#index", event_id: "1")
        end

        it "routes to #show" do
            expect(get: "/vehicles/1").to route_to("vehicles#show", id: "1")
        end

        it "routes to #create" do
            expect(post: "/events/1/vehicles").to route_to("vehicles#create", event_id: "1")
        end

        it "routes to #update" do
            expect(put: "/vehicles/1").to route_to("vehicles#update", id: "1")
        end

        it "routes to #destroy" do
            expect(delete: "/vehicles/1").to route_to("vehicles#destroy", id: "1")
        end
    end
end