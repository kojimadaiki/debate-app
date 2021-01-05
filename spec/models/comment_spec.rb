require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    describe '新規投稿する' do
      context 'ユーザーが新規投稿できる時' do
        it 'フォームが全て記入されている' do
          expect(@comment).to be_valid
        end

        it 'contentが空でもimageかvideoがあれば保存できる' do
          @comment.content = nil
          @comment.image = ''
          expect(@comment).to be_valid
        end

        it 'imageが空でも保存できる' do
          @comment.image = nil
          expect(@comment).to be_valid
        end

        it 'videoが空でも保存できる' do
          @comment.video = nil
          expect(@comment).to be_valid
        end
      end

      context 'ユーザーが新規投稿できない時'
      it 'contentとimageとvideoが空では保存できない' do
        @comment.content = nil
        @comment.image = nil
        @comment.video = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('テキストを入力してください')
      end

      it 'roomが紐付いていないと保存できない' do
        @comment.debate = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('部屋名を入力してください')
      end
    end
  end
end
