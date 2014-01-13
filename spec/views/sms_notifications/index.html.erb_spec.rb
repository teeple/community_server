require 'spec_helper'

describe "sms_notifications/index" do
  before(:each) do
    assign(:sms_notifications, [
      stub_model(SmsNotification,
        :receiver_user_id => 1,
        :sms_message => "MyText",
        :receiver_phone_no => "Receiver Phone No",
        :event_type => "Event Type",
        :status => "Status",
        :error_reason => "Error Reason"
      ),
      stub_model(SmsNotification,
        :receiver_user_id => 1,
        :sms_message => "MyText",
        :receiver_phone_no => "Receiver Phone No",
        :event_type => "Event Type",
        :status => "Status",
        :error_reason => "Error Reason"
      )
    ])
  end

  it "renders a list of sms_notifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Receiver Phone No".to_s, :count => 2
    assert_select "tr>td", :text => "Event Type".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Error Reason".to_s, :count => 2
  end
end
