class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
# このように記述することで、devise利用の機能（ユーザ登録、ログイン認証など）
# が使われる前にconfigure_permitted_parametersメソッドが実行されます。

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

