class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # ユーザーログイン後にユーザーページにリダイレクト
      reset_session #セッション固定攻撃対策
      log_in user #セッション用ヘルパーで定義したメソッドにuserオブジェクトを引数で渡す
      redirect_to user #userオブジェクトを引数で渡す
    else
      # エラーメッセージを作成
      flash.now[:danger] = 'Invalid email/password combination' # 本当は正しくない
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end
end
