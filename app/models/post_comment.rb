class PostComment < ApplicationRecord
	#commentは userと post_imageに対して　1:Nの関係にある
	#belong等終わったら一度 rails db:migrateすること
    belongs_to :user
    belongs_to :post_image
end
