require 'rails_helper'

RSpec.describe "/drivers", type: :request do
    describe "GET /show" do
        it "returns a successful response" do
            driver = create :driver
            get driver_url(driver)
            expect(response).to be_successful
        end
    end

    describe "PATCH /update" do
        context "with valid parameters" do
            let(:new_attributes) {
                build(:driver, first_name: "a new name").attributes
            }

            it "updates the requested driver" do
                driver = create :driver
                patch driver_url(driver), params: {driver: new_attributes}
                driver.reload
                expect(JSON.parse(response.body)["first_name"]).to eq(new_attributes["first_name"])
            end
        end

        context "with invalid parameters" do
            let(:new_attributes) {
                build(:driver, first_name: nil).attributes
            }

            it "does not update the requested driver" do
                driver = create :driver
                patch driver_url(driver), params: { driver: new_attributes }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end

    describe "DELETE /destroy" do
        it "destroys the requested driver" do
            driver = create :driver
            expect {
                delete driver_url(driver)
            }.to change(Driver, :count).by(-1)
        end

        it "expects an empty response body" do
            driver = create :driver
            delete driver_url(driver)
            expect(response.body).to be_empty
        end
    end
end