require 'rails_helper'

RSpec.describe "Login", type: :system do

  context "ログインをクリック" do
    it "ログインページに遷移" do
      visit root_path
      click_on "ログイン"
      expect(current_path).to eq login_path
    end
  end

  describe "ログイン" do
    let(:user) { create:user }
    
    before do
      visit login_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログイン"
    end
    
    context "正しい値を入力した場合" do
      let(:email) { "sample@example.com" }
      let(:password) { "password" }

      it "ログインできる" do
        visit login_path
        click_on "ログイン"
        expect(current_path).to eq login_path
      end
    end
    
    context "不正な値を入力した時" do
      let(:email) { "aiueokaki" }
      let(:password) { nil }
      
      it "エラーメッセージが表示される" do
        visit login_path
        click_on "ログイン"
        expect(page).to have_content "メールとパスワードの組み合わせが間違っています！"
      end
    end
  end
end