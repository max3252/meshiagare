class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user


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

  validates :price, numericality: { greater_than: 1, less_than: 9_999_999, message: 'Out of setting range' }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
   end

end
