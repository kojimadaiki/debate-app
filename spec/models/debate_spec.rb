require 'rails_helper'

RSpec.describe Debate, type: :model do
  before do
    @debate = FactoryBot.build(:debate)
  end

  describe 'チャットルームの作成' do
    context 'チャットルームを作成できる時' do
      it 'フォームが全て記入されている時' do
        expect(@debate).to be_valid
      end
    end
  

    context 'チャットルームを作成できない時' do
      it 'nameが空の時' do
        @debate.name = ""
        @debate.valid?
        expect(@debate.errors.full_messages).to include("ルーム名を入力してください")
      end
    end
  end
end
