require 'test_helper'

class Api::EventControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_event_create_url
    assert_response :success
  end

  test "should get edit" do
    get api_event_edit_url
    assert_response :success
  end

  test "should get update" do
    get api_event_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_event_destroy_url
    assert_response :success
  end

end
