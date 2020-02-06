Rails.application.routes.draw do
 	devise_for :users #devise使用時URLとしてusersを含む
 	root 'post_images#index'
  #resources のonly:をすると、[]内のルーティングだけを指定して作成できる(余計なの作らない)
 	resources :post_images, only: [:new, :create, :index, :show]
	
	resources :post_images, only: [:new, :create, :index, :show] do
    resource :post_comments, only: [:create, :destroy]
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
