require 'rails_helper'

RSpec.describe "Logout", type: :system do

  describe "ログアウト" do
    let(:user) { create:user }
    
    before do 
      visit login_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログイン"
    end
    
    context "ログアウト" do
      let(:email) { "sample@example.com" }
      let(:password) { "password" }

      it "ログアウトできる" do
        visit root_path
        click_link "ログアウト"
        expect(current_path).to eq root_path
      end
    end
  end
end