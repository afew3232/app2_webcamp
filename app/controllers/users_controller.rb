class UsersController < ApplicationController
  def show
  	#そのユーザ（@user）に関連付けられた投稿（.post_images）のみ、@post_imagesに渡す
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end
end
