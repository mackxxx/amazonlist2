require 'rails_helper'

RSpec.describe "Wants", type: :system do
  let(:user) { create :user }
  let(:item) { create :item }
  
  before do
    login_user
    click_on "アイテムを追加"
    fill_in "キーワードを2文字以上入力", with: item.name
    click_on "商品を検索"
  end

  describe "Wantボタン" do
    context "ボタンを初めて押す場合" do
      it "今欲しい ボタンが押せる" do
        click_on "今欲しい", match: :first
        expect(page).to have_content "商品を今欲しい に入れました。"
      end
    end
    
    context "ボタンをすでに押している場合" do
      it "いらない ボタンが押せる" do
        click_on "今欲しい", match: :first
        click_on "いらない", match: :first
        expect(page).to have_content "今欲しい を解除しました。"
      end
    end
  end
end