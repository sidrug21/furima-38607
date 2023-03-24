require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = User.new(nickname: 'aaaa', email: 'test@example.com', password: 'a000000', password_confirmation: 'a000000', last_name: 'い', first_name: 'あ', last_name_kana: 'イ', first_name_kana: 'ア', birthdate: Date.new(1993, 1, 1))
    end
  
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  
    it 'メールアドレスが一意性であること' do
      # 既存のユーザーを作成
      User.create(nickname: 'bbbb', email: 'test@example.com', password: 'a000000', password_confirmation: 'a000000', last_name: 'う', first_name: 'え', last_name_kana: 'ウ', first_name_kana: 'エ', birthdate: Date.new(1990, 1, 1))
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
  
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'testexample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = 'a0000'
      @user.password_confirmation = 'a0000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password_confirmation = 'a000001'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end