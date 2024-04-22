require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    # 「/articles」にGETリクエストを送る
    get articles_url
    # HTTPレスポンスが正しく返されることを確認
    assert_response :success
    # HTMLにa要素でYour Feedというテキストが表示されることを確認
    assert_select "a", "Your Feed"
  end
end
