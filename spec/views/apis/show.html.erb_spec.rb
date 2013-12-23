require 'spec_helper'

describe "apis/show" do
  before(:each) do
    @api = assign(:api, stub_model(Api,
      :ip => "Ip",
      :imsi => "Imsi",
      :ecgi => "Ecgi"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ip/)
    rendered.should match(/Imsi/)
    rendered.should match(/Ecgi/)
  end
end
