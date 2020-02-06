class ApplicationController < ActionController::Base
	#このコントローラーが動作する前に動く　ここにかくと、すべてのコントローラーが動作する前に
	#認証をすることになる。
	#:authenticate_user!とすることによって、
	#「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能を実装できます。
	before_action :authenticate_user!
	#loginなど行われる際、 before その前にconfigure_permitted.....が実行される
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected #他のコントローラーからも参照できる
  def configure_permitted_parameters
  	#sign_upの際、 nameのデータ操作を許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
