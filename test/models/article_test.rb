require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@foobar.com",
      password: "foobar", password_confirmation: "foobar")
    @user.save
    @article = Article.new(title: "今日の天気", junre: "ブログ", content: "今日は晴れています。", tag: "天気", user_id: @user.id)
  end

  test "should be valid" do
    assert @article.valid?
  end
end
