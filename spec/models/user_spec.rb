require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build :user }

  context "値が入力されている場合" do
    it "ユーザ登録は有効" do
      expect(user).to be_valid
    end
  end

  context "値が空白の場合" do
    it "ユーザ登録は無効" do
      user.name = nil
      expect(user).to be_invalid
    end
  end

  context "無効なEメールを登録しようとした場合" do
    it "emailのvalidateが正しく機能している" do
      address = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      address.each do |invalid_address|
        expect(build(:user, email: invalid_address)).to be_invalid
      end
    end
  end

  context "Eメールが重複している場合" do
    it "一意性が正しく機能する" do
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      user.save!
      expect(duplicate_user).to be_invalid
    end
  end

  it "emailを小文字に変換後の値と大文字を混ぜて登録されたアドレスが同一" do
    user.email = "Foo@ExAMPle.CoM"
    user.save!
    expect(user.reload.email).to eq "foo@example.com"
  end

  describe "パスワードの長さ" do
    context "パスワードが６桁の時" do
      it "正しい" do
        user = build(:user, password: "a" * 6, password_confirmation: "a" * 6)
        expect(user).to be_valid
      end
    end

    context "パスワードが５桁の時" do
      it "正しくない" do
        user = build(:user, password: "a" * 5, password_confirmation: "a" * 5)
        expect(user).to be_invalid
      end
    end
  end
end