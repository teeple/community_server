require 'test_helper'

class MessageFlagsControllerTest < ActionController::TestCase
  setup do
    @message_flag = message_flags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:message_flags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message_flag" do
    assert_difference('MessageFlag.count') do
      post :create, message_flag: { message_id: @message_flag.message_id, user_id: @message_flag.user_id }
    end

    assert_redirected_to message_flag_path(assigns(:message_flag))
  end

  test "should show message_flag" do
    get :show, id: @message_flag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message_flag
    assert_response :success
  end

  test "should update message_flag" do
    patch :update, id: @message_flag, message_flag: { message_id: @message_flag.message_id, user_id: @message_flag.user_id }
    assert_redirected_to message_flag_path(assigns(:message_flag))
  end

  test "should destroy message_flag" do
    assert_difference('MessageFlag.count', -1) do
      delete :destroy, id: @message_flag
    end

    assert_redirected_to message_flags_path
  end
end
