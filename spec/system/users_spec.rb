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
 
  context "入力項目に正しい値を入力" do
    it "ユーザー登録できる" do
      user = build(:user,name: "test",email: "test@example.com", password: "abcdefg", password_confirmation: "abcdefg")
      visit signup_path

      fill_in "お名前", with: user.name
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      fill_in "パスワード(確認)", with: user.password_confirmation
      click_button "新規登録"
      expect(page).to have_content("登録に成功しました。")
    end    
  end

  context "入力項目に誤った値を入力" do
    it "エラーメッセージが表示される" do
      visit signup_path

      fill_in "お名前", with: nil
      fill_in "メールアドレス", with: nil
      fill_in "パスワード", with: nil
      fill_in "パスワード(確認)", with: nil
      click_button "新規登録"
      expect(page).to have_content("ユーザの登録に失敗しました。")
    end
  end
end