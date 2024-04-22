require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    # fixtureのテスト用データを@userに代入
    @user = users(:takeshi)
  end

  # ユーザーが有効であることを確認
  test "should be valid" do
    assert @user.valid?
  end

  # nameカラムが空だと有効ではない
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  # emailカラムが空だと有効ではない
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  # nameカラムが50文字を超えると有効ではなくなる
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # emailカラムが255文字を超えると有効ではなくなる
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  # 有効なメールアドレスが有効と判定されるかを確認
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  # 規定に沿っていないメールアドレスが無効と判定されるかを確認
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # ユーザーを複製して保存できない（ユーザーは一意である）
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  # emailカラムは小文字に変換されて保存されていることを確認
  test "email addresses should be saved as lowercase" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  # passwordカラムとpasswordカラムが空だと有効ではない
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  # passwordカラムとpasswordカラムが5文字以下だと有効ではない
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
