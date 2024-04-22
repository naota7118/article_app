require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    assert root_path # root_pathが存在するかを確認
    get root_path #「/」にGETリクエストを送る
    assert_template 'articles/index' # articlesコントローラのindexアクションのビューを返す
    
    # ユーザー未登録の場合、ユーザー登録画面へのリンクがある
    assert_select "a[href=?]", signup_path
    # ログインしてない場合、ログイン画面へのリンクがある
    assert_select "a[href=?]", login_path
  end

end