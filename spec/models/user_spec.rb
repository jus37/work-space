require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '必要な項目すべて正しく入力されている' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいくとき' do
      it '名前が空白である' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'メールアドレスが空である' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが既に登録されているものと重複している' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに＠が含まれていない' do
        @user.email = 'aaacom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空である' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが英字のみである' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが数字のみである' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが5文字以下である' do
        @user.password = 'aaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Password confirmation doesn't match Password",
          'Password is too short (minimum is 6 characters)'
        )
      end
      it 'パスワードとパスワード（確認用）が一致しない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '電話番号が空である' do
        @user.telephone = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号に数字以外のものが含まれている' do
        @user.telephone = 'acdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号が11桁よりも多い' do
        @user.telephone = '000111222333'
        @user.valid?
        expect(@user.errors.full_messages).to include('Telephone is too long (maximum is 11 characters)')
      end
    end
  end
end
