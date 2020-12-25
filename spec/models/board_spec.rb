require 'rails_helper'

RSpec.describe Board, type: :model do
  before do
    @board = FactoryBot.build(:board)
  end

  describe '新規投稿' do
    context '新規投稿できる時' do
      it 'フォームを全て記入すれば新規投稿できる' do
        expect(@board).to be_valid
      end
    end

    context '新規投稿できない時' do
      it 'titleが空の時' do
        @board.title = ''
        @board.valid?
        expect(@board.errors.full_messages).to include('教える種目を入力してください')
      end

      it 'timeが空の時' do
        @board.start_time = ''
        @board.valid?
        expect(@board.errors.full_messages).to include('時間を入力してください')
      end
    end
  end
end
