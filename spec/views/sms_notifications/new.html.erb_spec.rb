require 'spec_helper'

describe "sms_notifications/new" do
  before(:each) do
    assign(:sms_notification, stub_model(SmsNotification,
      :receiver_user_id => "MyString",
      :integer => "MyString",
      :sms_message => "MyString",
      :text => "MyString",
      :receiver_phone_no => "MyString",
      :string => "MyString",
      :event_type => "MyString",
      :string => "MyString",
      :sent_at => "MyString",
      :datetime => "MyString",
      :status => "MyString",
      :string => "MyString",
      :error_reason => "MyText"
    ).as_new_record)
  end

  it "renders new sms_notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sms_notifications_path, "post" do
      assert_select "input#sms_notification_receiver_user_id[name=?]", "sms_notification[receiver_user_id]"
      assert_select "input#sms_notification_integer[name=?]", "sms_notification[integer]"
      assert_select "input#sms_notification_sms_message[name=?]", "sms_notification[sms_message]"
      assert_select "input#sms_notification_text[name=?]", "sms_notification[text]"
      assert_select "input#sms_notification_receiver_phone_no[name=?]", "sms_notification[receiver_phone_no]"
      assert_select "input#sms_notification_string[name=?]", "sms_notification[string]"
      assert_select "input#sms_notification_event_type[name=?]", "sms_notification[event_type]"
      assert_select "input#sms_notification_string[name=?]", "sms_notification[string]"
      assert_select "input#sms_notification_sent_at[name=?]", "sms_notification[sent_at]"
      assert_select "input#sms_notification_datetime[name=?]", "sms_notification[datetime]"
      assert_select "input#sms_notification_status[name=?]", "sms_notification[status]"
      assert_select "input#sms_notification_string[name=?]", "sms_notification[string]"
      assert_select "textarea#sms_notification_error_reason[name=?]", "sms_notification[error_reason]"
    end
  end
end
