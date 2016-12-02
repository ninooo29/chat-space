require 'rails_helper'

describe User do

  it "パスワードが8文字以下のとき無効な状態であること" do
    user = User.new(password: "11111")
    user.valid?
    expect(user.errors[:password]).to include("は8文字以上で入力してください。")
  end

  it "全てが入力されていれば有効な状態であること" do
    user = User.new(
      name: 'kazuki',
      email: 'aaa@gmail.com',
      password: '11111111')
    expect(user).to be_valid
  end

  it "nameがないと無効な状態であること" do
    user = User.new(name:nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください。")
  end

  it "emailがないと無効な状態であること" do
    user = User.new(email:nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください。")
  end

  it "passwordがないと無効な状態であること" do
    user = User.new(password:nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください。")
  end

  it "アドレスが重複している場合は無効な状態であること" do
    User.create(
      name: 'kazuki',
      email: 'aaa@gmail.com',
      password: '11111111'
    )
    user = User.new(
      name: 'taro',
      email: 'aaa@gmail.com',
      password: '33333333'
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します。")
  end

end
