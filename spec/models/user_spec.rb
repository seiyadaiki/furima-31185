require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,family_name,first_name,family_name_frigana,first_name_frigana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが40文字以下で登録できる' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end
      it 'emailは@があれば登録できる' do
        @user.email = 'kkk@gmail.com'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'kkk000'
        @user.password_confirmation = 'kkk000'
        expect(@user).to be_valid
      end
      it 'family_nameとfirst_nameは全角ひらがな,全角カタカナ,漢字であれば登録できる' do
        @user.family_name = 'アベ'
        @user.first_name = '太ろう'
        expect(@user).to be_valid
      end
      it 'family_name_friganaとfirst_name_frignaは全角ひらがな,全角カタカナ,漢字であれば登録できる' do
        @user.family_name_frigana = 'アベ'
        @user.first_name_frigana = 'タロウ'
        expect(@user).to be_valid
      end
      it 'birthdayは1930-01-01以降であれば登録できる' do
        @user.birthday = '1990-01-01'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'nicknameが41文字以上であれば登録できない' do
        @user.nickname = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 40 characters)')
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
      it 'emailに@がない場合登録できない' do
        @user.email = 'kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'kkk00'
        @user.password_confirmation = 'kkk00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは数字だけだと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'passwordは英字だけだと登録できない' do
        @user.password = 'kkkkkk'
        @user.password_confirmation = 'kkkkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters.')
      end
      it 'family_nameが半角では登録できない' do
        @user.family_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters.')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'family_name_friganaが空では登録できない' do
        @user.family_name_frigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name frigana is invalid. Input full-width katakana characters.')
      end
      it 'family_name_friganaがひらがなでは登録できない' do
        @user.family_name_frigana = 'あべ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name frigana is invalid. Input full-width katakana characters.')
      end
      it 'first_name_friganaが空では登録できない' do
        @user.first_name_frigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name frigana is invalid. Input full-width katakana characters.')
      end
      it 'first_name_friganaがひらがなでは登録できない' do
        @user.first_name_frigana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name frigana is invalid. Input full-width katakana characters.')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
