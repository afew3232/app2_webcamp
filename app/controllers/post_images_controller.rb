class PostImagesController < ApplicationController
	#画像投稿表示
	def new
		@post_image = PostImage.new
	end
	#投稿画像を保存
	def create

    	@post_image = PostImage.new(post_image_params)
    	@post_image.user_id = current_user.id
    	@post_image.save
    	redirect_to post_images_path
	end
	#投稿画像リストを表示
	def index
		@post_images = PostImage.all
	end
	#投稿画像の詳細表示
	def show
		@post_image = PostImage.find(params[:id])
	end

	private
    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
