require 'spec_helper'

describe "sms_notifications/new" do
  before(:each) do
    assign(:sms_notification, stub_model(SmsNotification,
      :receiver_user_id => 1,
      :sms_message => "MyText",
      :receiver_phone_no => "MyString",
      :event_type => "MyString",
      :status => "MyString",
      :error_reason => "MyString"
    ).as_new_record)
  end

  it "renders new sms_notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sms_notifications_path, "post" do
      assert_select "input#sms_notification_receiver_user_id[name=?]", "sms_notification[receiver_user_id]"
      assert_select "textarea#sms_notification_sms_message[name=?]", "sms_notification[sms_message]"
      assert_select "input#sms_notification_receiver_phone_no[name=?]", "sms_notification[receiver_phone_no]"
      assert_select "input#sms_notification_event_type[name=?]", "sms_notification[event_type]"
      assert_select "input#sms_notification_status[name=?]", "sms_notification[status]"
      assert_select "input#sms_notification_error_reason[name=?]", "sms_notification[error_reason]"
    end
  end
end
