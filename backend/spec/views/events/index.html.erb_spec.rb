require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign :events, [
      create(:event), 
      create(:event, name: "Another Event"), 
      create(:event, name: "Some other event")]
  end

  it "renders a list of events" do
    render
  end
end
