require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    # 「/users/new」にGETリクエストを送る
    get new_user_url
    # HTTPレスポンスを正しく返すことを確認
    assert_response :success
  end
end