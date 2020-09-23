class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :messages
  has_many :sns_credentials

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

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
