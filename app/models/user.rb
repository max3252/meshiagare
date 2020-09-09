class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture 
  belongs_to_active_hash :gender
  belongs_to_active_hash :age

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :prefecture_id
    validates :gender_id
    validates :age_id
  end

  with_options presence: true do
    validates :nickname
    validates :allergies
  end

  validates :password,
            confirmation: true,
            format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英字と数字を含めてください' }

end
