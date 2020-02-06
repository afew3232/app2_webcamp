class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # deviseで使用する機能

    #アソシエーション（関連付け）
    #userはpost_imagesを所持している　post_image(s)で複数系で書く。
    #has_many model名（1:Nの関係になるもの user_idと画像のidの関連付け）
    #親子のアソシエーションが終わったら rails db:migrateでテーブル作成が必要
  has_many :post_images, dependent: :destroy
  has_many :post_comment, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
