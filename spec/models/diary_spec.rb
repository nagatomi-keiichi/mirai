require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do
    @diary = FactoryBot.build(:diary)
end

      it 'タイトルと画像と日時が存在すれば登録できること' do
        expect(@diary).to be_valid
    end

    it 'タイトルが空では登録できないこと' do
      @diary.title = nil
      @diary.valid?
      expect(@diary.errors.full_messages).to include("Title can't be blank")
    end

    it '画像が空では登録できないこと' do
      @diary.image = nil
      @diary.valid?
      expect(@diary.errors.full_messages).to include("Image can't be blank")
    end

  end