require 'rails_helper'

describe User do



  it "妥当なオブジェクト" do
    user = build(:user)
    expect(user).to be_valid
  end

  context "nameがないと無効な状態であること" do
    let(:name){ nil }
    example {"を入力してください。"}
  end

  context "パスワードが7文字以下のとき無効な状態であること" do
    let(:password){ "11111" }
    example {"は7文字以上で入力してください。"}
  end

  context "パスワードが８文字以上のとき有効な値であること" do
    let(:password){ "11111111" }
    it { be_valid }
  end

  context "emailがないと無効な状態であること" do
    let(:email){ nil }
    example{"を入力してください。"}
  end

  context "passwordがないと無効な状態であること" do
    let(:password){ nil }
    example { "を入力してください。" }
  end

  context "パスワード確認がないと無効であること" do
    let(:password_confirmation){ nil }
    example {"とパスワードの入力が一致しません。"}
  end

  it "アドレスが重複している場合は無効な状態であること" do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include("はすでに存在します。")
  end

end
