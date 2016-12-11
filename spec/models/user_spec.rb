require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a name, email, password" do
      user = build(:user)
      expect(user).to be_valid
    end

    describe 'name to change nil' do
      let(:user){ build(:user, name: nil) }
      it 'is invalid without a name' do
        user.valid?
        expect(user.errors[:name]).to include("を入力してください。")
      end
    end

    describe 'email to change nil' do
      let(:user){ build(:user, email: nil)}
      it "is invalid without a email" do
        user.valid?
        expect(user.errors[:email]).to include("を入力してください。")
      end
    end

    describe 'password to change nil' do
      let(:user){ build(:user, password: nil)}
      it "is valid without a password" do
        user.valid?
        expect(user.errors[:password]).to include("を入力してください。")
      end
    end

    describe 'password_confirmation to change nil' do
      let(:user){ build(:user, password_confirmation: "") }
      it "is invalid without a password_confirmation although with a password" do
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
      end
    end

    describe 'password chande to word count 7' do
      let(:user){ build(:user, password: "111111")}
      it "is valid with a password that has less than 7 characters " do
        user.valid?
        expect(user.errors[:password]). to include("は8文字以上で入力してください。")
      end
    end

    describe 'password change to word count 8' do
      let(:user){ build(:user, password: "aaaaaaaa")}
      it "is valid with a password that has more than 8 characters" do
        expect(user).to be_valid
      end
    end
  end
end
