class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :user_icon, ImageUploader

  # association
  has_one :producer, dependent: :destroy
  # userが「買った」商品
  has_many :buyed_items, foreign_key: 'buyer_id',
                         class_name: 'Item',
                         dependent: :destroy
  # userが 「現在売っている」商品
  has_many :selling_items, -> { where('buyer_id is NULL') },
           foreign_key: 'seller_id', class_name: 'Item', dependent: :destroy
  # userが「既に売った」商品
  has_many :sold_items, -> { where('buyer_id is not NULL') },
           foreign_key: 'seller_id', class_name: 'Item', dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_items, through: :favorites, source: :item

  has_many :active_relationships, foreign_key: 'follower_id',
                                  class_name: 'Relationship',
                                  dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id',
                                   class_name: 'Relationship',
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followed, through: :passive_relationships, source: :follower

  has_many :comments, dependent: :destroy

  has_many :transactions, dependent: :destroy

  #指定のユーザーをフォローする
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  #指定のユーザーのフォローを解除する
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  #フォローしているか確認する
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
end
