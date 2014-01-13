require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :event_type => "Event Type"
      ),
      stub_model(Event,
        :event_type => "Event Type"
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Event Type".to_s, :count => 2
  end
end
