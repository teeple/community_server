require 'spec_helper'

describe "apis/edit" do
  before(:each) do
    @api = assign(:api, stub_model(Api,
      :ip => "MyString",
      :imsi => "MyString",
      :ecgi => "MyString"
    ))
  end

  it "renders the edit api form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", api_path(@api), "post" do
      assert_select "input#api_ip[name=?]", "api[ip]"
      assert_select "input#api_imsi[name=?]", "api[imsi]"
      assert_select "input#api_ecgi[name=?]", "api[ecgi]"
    end
  end
end
