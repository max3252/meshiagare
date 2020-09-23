require 'rails_helper'

describe Post do
  before do
    @post = FactoryBot.build(:post)
    @post.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '写真投稿' do
    context '投稿がうまくいくとき' do
      it '全ての項目が存在すれば投稿できる' do
        expect(@post).to be_valid
      end

      it '販売価格が¥300以上¥9,999,999以下であれば投稿できる' do
        @post.price = '1000'
        expect(@post).to be_valid
      end

      it 'お店の住所が空でも投稿できる' do
        @post.address = ''
        expect(@post).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'imageが空では投稿できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('画像を入力してください')
      end

      it 'nameが空では投稿できない' do
        @post.name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('タイトルを入力してください')
      end

      it 'genre_idを選択しなければ投稿できない' do
        @post.genre_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include('ジャンルを選択してください')
      end

      it 'allergiesが空では投稿できない' do
        @post.allergies = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('アレルギー情報を入力してください')
      end

      it 'store_nameが空では投稿できない' do
        @post.store_name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('お店の名前を入力してください')
      end

      it 'priceが空では投稿できない' do
        @post.price = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('金額を入力してください')
      end

      it 'priceは¥1以上でなければ投稿できない' do
        @post.price = '0'
        @post.valid?
        expect(@post.errors.full_messages).to include('金額を設定範囲内で入力してください(¥1~¥999999)')
      end

      it 'priceは¥9,999,999以下でなければ投稿できない' do
        @post.price = '10000000'
        @post.valid?
        expect(@post.errors.full_messages).to include('金額を設定範囲内で入力してください(¥1~¥999999)')
      end

      it 'priceは半角数字でなければ投稿できない' do
        @post.price = '１０００'
        @post.valid?
        expect(@post.errors.full_messages).to include('金額を設定範囲内で入力してください(¥1~¥999999)')
      end

      it 'textが空では投稿できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('メニューの説明を入力してください')
      end
    end
  end
end
