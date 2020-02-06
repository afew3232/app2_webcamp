class PostImagesController < ApplicationController
	#画像投稿表示
	def new
		@post_image = PostImage.new
	end
	#投稿画像を保存
	def create

        @post_image = PostImage.new(post_image_params)
        @post_image.user_id = current_user.id
        if @post_image.save
          redirect_to post_images_path
        else
          render :new
        end
	end
	#投稿画像リストを表示
	def index
		#kaminariのインストールで可能になった 1page分決められた数だけデータ取得
		@post_images = PostImage.page(params[:page]).reverse_order
	end
	#投稿画像の詳細表示
	def show
		@post_image = PostImage.find(params[:id])
		@post_comment = PostComment.new

	end

	private
    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
