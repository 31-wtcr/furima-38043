require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録可能なとき' do
      it "必要な項目を満たしていれば新規登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空で不可' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空で不可' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailの重複で不可' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@がなく不可' do
        @user.email ='testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空で不可' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満で不可'do
        @user.password = Faker::Internet.password(min_length: 1, max_length: 5)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角数字のみで不可'do
        @user.password = Faker::Lorem.characters(number: 6, min_numeric: 6 )
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Complexity requirement not met. Length should be 6-70 characters and include: 1 alphabet, 1 digit")
      end
      it 'passwordが半角英字のみで不可'do
        @user.password = Faker::Lorem.characters(number: 6, min_alpha: 6)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Complexity requirement not met. Length should be 6-70 characters and include: 1 alphabet, 1 digit")
      end
      it 'passwordが全角文字で不可'do
        @user.password = 'ｈｋｇｄｓ４５３'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Complexity requirement not met. Length should be 6-70 characters and include: 1 alphabet, 1 digit")
      end
      it 'passwordとpassword_confirmationが不一致で不可'do
        @user.password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1 )
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空で不可' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空で不可' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが半角文字で不可' do
        @user.last_name = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameが半角文字で不可' do
        @user.first_name = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_name_katakanaが空で不可' do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it 'first_name_katakanaが空で不可' do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it 'last_name_katakanaがひらがなで不可' do
        @user.last_name_katakana = Gimei.last.hiragana
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end
      it 'last_name_katakanaが漢字で不可' do
        @user.last_name_katakana = Gimei.last.kanji
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end
      it 'last_name_katakanaが半角文字で不可' do
        @user.last_name_katakana = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end
      it 'first_nameがひらがなで不可' do
        @user.first_name_katakana = Gimei.first.hiragana
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end
      it 'first_nameが漢字で不可' do
        @user.first_name_katakana = Gimei.first.kanji
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end
      it 'first_nameが半角文字で不可' do
        @user.first_name_katakana = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end
      it 'birthdayが空で不可' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
