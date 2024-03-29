require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      context'新規登録できるとき'do
    it 'nameとemail、passwordとpassword_confirmationと趣味が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it "passwordが6文字以上であれば登録できる" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      expect(@user).to be_valid
    end

    context '新規登録できない時' do
    it 'nameが空では登録できないこと' do
      @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが5文字以下では登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
  expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it '趣味が空では登録出来ないこと' do
      @user.hobby = nil
       @user.valid?
       expect(@user.errors.full_messages).to include()
    end
   end
   end
   end
  end
end