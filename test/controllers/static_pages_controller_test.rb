require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get create" do
    get static_pages_create_url
    assert_response :success
  end

  test "should get edit" do
    get static_pages_edit_url
    assert_response :success
  end
end
