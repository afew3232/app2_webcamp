class PostImage < ApplicationRecord
	#アソシエーション(関連付け)
	#has_menyと逆の機能 postimageはuserに所持されている。
	#親と子のアソシエーションが終わったら　rails db:migrateでテーブル作成が必要
	belongs_to :user
	attachment :image
	has_many :post_comments, dependent: :destroy
end
