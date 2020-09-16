class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  
  with_options presence: true do
    validates :image
    validates :name
    validates :genre_id
    validates :allergies
    validates :store_name
    validates :price
    validates :text
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :genre_id
  end

  validates :price, numericality: { greater_than: 1, less_than: 999_999, message: 'を設定範囲内で入力してください(¥1~¥999999)' }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
   end

end
