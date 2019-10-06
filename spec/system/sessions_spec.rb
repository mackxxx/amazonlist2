require 'rails_helper'

RSpec.describe "Sessions", type: :system do
   context "ログインをクリック" do
    it "ログインページに遷移" do
      visit root_path
      click_on "ログイン"
      expect(page).to have_content("ログイン")
    end
  end

  describe "ログイン" do
    before do
      visit login_path
      fill_in "メールアドレス", with: email
      fill_in "パスワード", with: password
      click_button "ログイン"
    end

    context "正しい値を入力した場合" do
      let(:email) { "taro@example.com" }
      let(:password) { "password" }

      it "ログインできる" do
        expect(page).to have_content "ログインしました。"
      end
    end
    
    context "不正な値を入力した時" do
      let(:email) { "aiueokaki" }
      let(:password) { nil }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ログインに失敗しました。"
      end
    end
  end