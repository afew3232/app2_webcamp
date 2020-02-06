class ApplicationController < ActionController::Base

	#loginなど行われる際、 before その前にconfigure_permitted.....が実行される
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected #他のコントローラーからも参照できる
  def configure_permitted_parameters
  	#sign_upの際、 nameのデータ操作を許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
