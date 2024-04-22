require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    # 「/login」にGETリクエストを送る
    get login_path
    # HTTPレスポンスが正しく返ることを確認
    assert_response :success
  end
end
