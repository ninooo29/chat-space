require 'rails_helper'

describe Message do
  describe '#create' do
    let(:messaege){ build(:message) }
    it "is valid with a body" do
      expect(message).to be_valid
    end

    describe "body change to nil"
      let(:message){ build(:message, body: nil)}
      it "is invalid without a body" do
        message.valid?
        expect(message.errors[:body]).to include("を入力してください。")
      end
  end
end
