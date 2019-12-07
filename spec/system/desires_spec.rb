require 'rails_helper'

RSpec.describe "Desires", type: :system do
    let(:user) { create :user }
    let(:item) { create :item }

    before do
      visit login_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログイン"
      click_on "アイテムを追加"
      fill_in "キーワードを2文字以上入力", with: item.name
      click_on "商品を検索"
    end
  
  describe "Desireボタン" do
    context "アイテムが未登録の場合" do
      it "後で欲しい ボタンが押せる" do
        click_on "後で欲しい", match: :first
        expect(page).to have_content "商品を後で欲しい に入れました。"
      end
    end
    
    context "アイテムが登録済の場合" do
      it "まだいらない ボタンが押せる" do
        click_on "後で欲しい", match: :first
        click_on "まだいらない", match: :first
        expect(page).to have_content "後で欲しい を解除しました。"
      end
    end
  end
end