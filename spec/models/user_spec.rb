require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,password,password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'no_at_mark.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが一致していなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '英字のみのpasswordでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '数字のみのpasswordでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '全角文字を含むpasswordでは登録できない' do
        @user.password = 'tstpswd'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'zenkaku_first_nameが空では登録できない' do
        @user.zenkaku_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Zenkaku first name can't be blank")
      end
      it 'zenkaku_first_nameに半角文字が含まれていると登録できない' do
        @user.zenkaku_first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Zenkaku first name is invalid')
      end
      it 'zenkaku_last_nameが空では登録できない' do
        @user.zenkaku_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Zenkaku last name can't be blank")
      end
      it 'zenkaku_last_nameに半角文字が含まれていると登録できない' do
        @user.zenkaku_last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Zenkaku last name is invalid')
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_first_nameにカタカナ以外が含まれていると登録できない' do
        @user.kana_first_name = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'kana_last_nameにカタカナ以外が含まれていると登録できない' do
        @user.kana_last_name = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid')
      end
      it '生年月日が空では登録できない' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
