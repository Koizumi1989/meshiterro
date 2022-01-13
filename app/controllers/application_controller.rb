class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
# このように記述することで、devise利用の機能（ユーザ登録、ログイン認証など）
# が使われる前にconfigure_permitted_parametersメソッドが実行されます。

  def after_sign_in_path_for(resource)
    about_path
  end
  # after_sign_in_path_forはDeviseが用意しているメソッドで、
  # サインイン後にどこに遷移するかを設定しているメソッドです。
  # after_sign_in_path_forは、Deviseの初期設定ではroot_pathになっています。
  # サインイン後にルートパスに遷移していたのはこのためです。
  # 上記のような記述をすることで、初期設定を上書きすることができます。
  # 今回はAboutページへ遷移するように設定しました。

  def after_sign_out_path_for(resource)
    about_path
  end
  # 上のsign_in_pathの逆

  protected
# privateは記述をしたコントローラ内でしか参照できません。
# 一方、protectedは呼び出された他のコントローラからも参照することができます。

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

# configure_permitted_parametersメソッドでは、
# devise_parameter_sanitizer.permitメソッドを使うことで
# ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています。
# 先ほど述べたように、これはストロングパラメータと同様の機能です。

