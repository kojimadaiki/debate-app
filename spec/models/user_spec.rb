require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録できる時' do
      it 'フォームを全て記入すれば新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録できない時' do
      it 'nameが空の時' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end

      it 'emailが空の時' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end

      it 'emailに@が含まれていない' do
        @user.email = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end

      it 'passwordが空である' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'passwordが英数字で構成されていない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字を使用してください')
      end

      it 'passwordが5文字以下' do
        @user.password = 'aa1aa'
        @user.password_confirmation = 'aa1aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'password_confirmationがpasswordと一致していない' do
        @user.password = 'aaa1aaa'
        @user.password_confirmation = 'aaa1aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'styleが空' do
        @user.style = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('専門種目を入力してください')
      end
    end
  end
end
