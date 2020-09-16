require "rails_helper"

RSpec.describe DriversController, type: :routing do
    describe "nested shallow event drivers routing" do
        it "routes to #index" do
            expect(get: "/events/1/drivers").to route_to("drivers#index", event_id: "1")
        end
        
        it "routes to #create" do
            expect(post: "/events/1/drivers").to route_to("drivers#create", event_id: "1")
        end
    end

    describe "shallow drivers routing" do
        it "routes to #show" do
            expect(get: "/drivers/1").to route_to("drivers#show", id: "1")
        end


        it "routes to #update" do
            expect(put: "/drivers/1").to route_to("drivers#update", id: "1")
        end

        it "routes to #destroy" do
            expect(delete: "/drivers/1").to route_to("drivers#destroy", id: "1")
        end
    end
end