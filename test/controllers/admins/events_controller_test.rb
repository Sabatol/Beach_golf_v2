require 'test_helper'

class Admins::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_events_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_events_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get admins_events_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_events_update_url
    assert_response :success
  end

  test "should get index" do
    get admins_events_index_url
    assert_response :success
  end

end
