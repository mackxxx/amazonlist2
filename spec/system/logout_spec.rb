require 'rails_helper'

RSpec.describe "Logout", type: :system do

  context "ログインをクリック" do
    it "ログインページに遷移" do
      visit root_path
      click_on "ログイン"
      expect(page).to have_content("ログイン")
    end
  end

  describe "ログアウト" do
    before do
      user = create(:user, email: "sample@example.com", password: "password") 
      visit login_path
      fill_in "メールアドレス", with: email
      fill_in "パスワード", with: password
      click_button "ログイン"
    end
    
    context "ログアウト" do
      let(:email) { "sample@example.com" }
      let(:password) { "password" }

      it "ログアウトできる" do
        visit root_path
        click_link "ログアウト"
        expect(current_path) == root_path
      end
    end
  end
end
  
     