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
        expect(page).to have_content "ログインに成功しました。"
      end
    end
    
    context "全ての項目が入力されていない場合" do
      let(:email) { nil }
      let(:password) { nil }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ログインに失敗しました。"
        expect(page).to have_content "Nameを入力してください"
        expect(page).to have_content "Emailを入力してください"
        expect(page).to have_content "Emailは不正な値です"
        expect(page).to have_content "Passwordを入力してください"
      end
    end
    
    context "emailのみ入力されていない場合" do
      let(:email) { "yamada@yahoo.co.jp" }
      let(:password) { "test123" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
        expect(page).to have_content "Nameを入力してください"
      end
    end

    context "パスワードのみ入力されていない場合" do
      let(:email) { nil }
      let(:password) { "aiueokaki" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
        expect(page).to have_content "Emailを入力してください"
        expect(page).to have_content "Emailは不正な値です"
      end
    end
  end