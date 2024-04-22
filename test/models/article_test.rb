require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  def setup
    # @user = User.new(name: "Example User", email: "user@foobar.com",
    #   password: "foobar", password_confirmation: "foobar")
    # @user.save
    @user = users(:takeshi)
    @article = @user.articles.build(title: "今日の天気", junre: "ブログ", content: "今日は晴れています。", tag: "天気")
  end

  # 有効なarticleデータが有効と判断されることを確認
  test "should be valid" do
    assert @article.valid?
  end

  # articleオブジェクトのcontentカラムが空だと有効ではない
  test "content should be present" do
    @article.content = nil
    assert_not @article.valid?
  end

  # articleオブジェクトのuser_idカラムが空だと有効ではない(必ずuserに所属する)
  test "user_id should be present" do
    @article.user_id = nil
    assert_not @article.valid?
  end
end
