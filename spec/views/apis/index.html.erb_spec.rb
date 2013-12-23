require 'spec_helper'

describe "apis/index" do
  before(:each) do
    assign(:apis, [
      stub_model(Api,
        :ip => "Ip",
        :imsi => "Imsi",
        :ecgi => "Ecgi"
      ),
      stub_model(Api,
        :ip => "Ip",
        :imsi => "Imsi",
        :ecgi => "Ecgi"
      )
    ])
  end

  it "renders a list of apis" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
    assert_select "tr>td", :text => "Imsi".to_s, :count => 2
    assert_select "tr>td", :text => "Ecgi".to_s, :count => 2
  end
end
