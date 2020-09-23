require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが英語と数字を含めた6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailに@が含まれていない場合は登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password = 'abc123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordが英語と数字を含まれていない場合は登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英字と数字を含めてください')
      end

      it 'prefecture_idを選択しなければ登録できない' do
        @user.prefecture_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('出身地を選択してください')
      end

      it 'gender_idを選択しなければ登録できない' do
        @user.gender_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('性別を選択してください')
      end

      it 'age_idを選択しなければ登録できない' do
        @user.age_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('年齢を選択してください')
      end

      it 'allergiesが空では登録できないこと' do
        @user.allergies = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('アレルギー情報を入力してください')
      end
    end
  end
end
