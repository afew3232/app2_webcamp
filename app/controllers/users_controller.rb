class UsersController < ApplicationController
  def show
  	#そのユーザ（@user）に関連付けられた投稿（.post_images）のみ、@post_imagesに渡す
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end
  def edit
  	#編集用のform_forを使う準備をしている
        @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    	params.require(:user).permit(:name, :profile_image)
	end
end
