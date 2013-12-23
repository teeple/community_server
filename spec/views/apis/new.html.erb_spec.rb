require 'spec_helper'

describe "apis/new" do
  before(:each) do
    assign(:api, stub_model(Api,
      :ip => "MyString",
      :imsi => "MyString",
      :ecgi => "MyString"
    ).as_new_record)
  end

  it "renders new api form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", apis_path, "post" do
      assert_select "input#api_ip[name=?]", "api[ip]"
      assert_select "input#api_imsi[name=?]", "api[imsi]"
      assert_select "input#api_ecgi[name=?]", "api[ecgi]"
    end
  end
end
