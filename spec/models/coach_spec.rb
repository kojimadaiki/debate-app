require 'rails_helper'

RSpec.describe Coach, type: :model do
  before do
    @coach = FactoryBot.build(:coach)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録できる時' do
      it 'フォームを全て記入すれば新規登録できる' do
        expect(@coach).to be_valid
      end
    end

    context 'ユーザー新規登録できない時' do
      it 'nameが空の時' do
        @coach.name = ''
        @coach.valid?
        expect(@coach.errors.full_messages).to include('名前を入力してください')
      end

      it 'emailが空の時' do
        @coach.email = ''
        @coach.valid?
        expect(@coach.errors.full_messages).to include('メールアドレスを入力してください')
      end

      it 'emailに@が含まれていない' do
        @coach.email = 'abcdefg'
        @coach.valid?
        expect(@coach.errors.full_messages).to include('メールアドレスは不正な値です')
      end

      it '重複したemailが存在する場合登録できない' do
        @coach.save
        another_coach = FactoryBot.build(:coach)
        another_coach.email = @coach.email
        another_coach.valid?
        expect(another_coach.errors.full_messages).to include('メールアドレスはすでに存在します')
      end

      it 'passwordが空である' do
        @coach.password = ''
        @coach.valid?
        expect(@coach.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'passwordが英数字で構成されていない' do
        @coach.password = '111111'
        @coach.password_confirmation = '111111'
        @coach.valid?
        expect(@coach.errors.full_messages).to include('パスワードは半角英数字を使用してください')
      end

      it 'passwordが5文字以下' do
        @coach.password = 'aa1aa'
        @coach.password_confirmation = 'aa1aa'
        @coach.valid?
        expect(@coach.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'password_confirmationがpasswordと一致していない' do
        @coach.password = 'aaa1aaa'
        @coach.password_confirmation = 'aaa1aaaa'
        @coach.valid?
        expect(@coach.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'teach_styleが空' do
        @coach.teach_style = ''
        @coach.valid?
        expect(@coach.errors.full_messages).to include('教えられる種目を入力してください')
      end
    end
  end
end
