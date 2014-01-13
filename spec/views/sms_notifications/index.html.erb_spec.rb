require 'spec_helper'

describe "sms_notifications/index" do
  before(:each) do
    assign(:sms_notifications, [
      stub_model(SmsNotification,
        :receiver_user_id => "Receiver User",
        :integer => "Integer",
        :sms_message => "Sms Message",
        :text => "Text",
        :receiver_phone_no => "Receiver Phone No",
        :string => "String",
        :event_type => "Event Type",
        :string => "String",
        :sent_at => "Sent At",
        :datetime => "Datetime",
        :status => "Status",
        :string => "String",
        :error_reason => "MyText"
      ),
      stub_model(SmsNotification,
        :receiver_user_id => "Receiver User",
        :integer => "Integer",
        :sms_message => "Sms Message",
        :text => "Text",
        :receiver_phone_no => "Receiver Phone No",
        :string => "String",
        :event_type => "Event Type",
        :string => "String",
        :sent_at => "Sent At",
        :datetime => "Datetime",
        :status => "Status",
        :string => "String",
        :error_reason => "MyText"
      )
    ])
  end

  it "renders a list of sms_notifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Receiver User".to_s, :count => 2
    assert_select "tr>td", :text => "Integer".to_s, :count => 2
    assert_select "tr>td", :text => "Sms Message".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "Receiver Phone No".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Event Type".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Sent At".to_s, :count => 2
    assert_select "tr>td", :text => "Datetime".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
