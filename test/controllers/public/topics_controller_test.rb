require "test_helper"

class Public::TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_topics_new_url
    assert_response :success
  end

  test "should get show" do
    get public_topics_show_url
    assert_response :success
  end

  test "should get create" do
    get public_topics_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_topics_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_topics_update_url
    assert_response :success
  end
end
