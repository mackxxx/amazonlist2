require 'rails_helper'

RSpec.describe "Users", type: :system do
  
  let(:user) { build :user }
  
  context "新規登録をクリック" do
    it "新規登録ページに遷移" do
      visit root_path
      click_on "新規登録"
      expect(page).to have_content("新規登録")
    end
  end
 
  context "amazonListを始めるをクリック" do
    it "新規登録ページに遷移" do
      visit root_path
      click_on "amazonListを始める"
      expect(page).to have_content("新規登録")
    end
  end

  describe "ユーザー登録" do
    before do
      visit signup_path
      fill_in "お名前", with: name
      fill_in "メールアドレス", with: email
      fill_in "パスワード", with: password
      fill_in "パスワード(確認)", with: password_confirmation
      click_button "新規登録"
    end

    context "正しい値を入力した場合" do
      let(:name) { "tanaka taro" }
      let(:email) { "taro@example.com" }
      let(:password) { "password" }
      let(:password_confirmation) { "password" }

      it "ユーザーを登録できる" do
        expect(page).to have_content "登録に成功しました。"
      end
    end
    
    context "全て入力されていない場合" do
      let(:name) { nil }
      let(:email) { nil }
      let(:password) { nil }
      let(:password_confirmation) { nil }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end
    
    context "名前のみ入力されていない場合" do
      let(:name) { nil }
      let(:email) { "yamada@yahoo.co.jp" }
      let(:password) { "test123" }
      let(:password_confirmation) { "test123" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "Nameを入力してください"
      end
    end

    context "emailのみ入力されていない場合" do
      let(:name) { "yamada sinichiro" }
      let(:email) { nil }
      let(:password) { "aiueokaki" }
      let(:password_confirmation) { "aiueokaki" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "Emailを入力してください"
        expect(page).to have_content "Emailは不正な値です"
      end
    end
    
    context "パスワードのみ入力されていない場合" do
      let(:name) { "kato yuki" }
      let(:email) { "kato@outlook.com" }
      let(:password) { nil }
      let(:password_confirmation) { "katoyuki" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "Passwordを入力してください"
      end
    end

    context "パスワード(確認)のみ入力されていない場合" do
      let(:name) { "suzuki ai" }
      let(:email) { "suzuki@ai.com" }
      let(:password) { "SUzuki$123" }
      let(:password_confirmation) { nil }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "Password confirmationとPasswordの入力が一致しません"
      end
    end
  end
end