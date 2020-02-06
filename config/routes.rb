Rails.application.routes.draw do
 	devise_for :users #devise使用時URLとしてusersを含む
 	root 'post_images#index'
  #resources のonly:をすると、[]内のルーティングだけを指定して作成できる(余計なの作らない)
 	resources :post_images, only: [:new, :create, :index, :show]


 	#resource単数にすると、そのコントローラのidがリクエストに含まれなくなります。
 	#post_commentはshowページがなく、idの受け渡しが不要のため。
	#この文を実行すると post_image_post_comments のroutesが作成される。
	#ネストすると呼ぶ
	resources :post_images, only: [:new, :create, :index, :show] do
    	resource :post_comments, only: [:create, :destroy]
	end


	resources :post_images, only: [:new, :create, :index, :show] do
      resource :favorites, only: [:create, :destroy]
      resource :post_comments, only: [:create, :destroy]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
