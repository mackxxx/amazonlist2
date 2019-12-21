require 'rails_helper'

RSpec.describe "Wants", type: :system do
  let(:user) { create :user }++
  let(:item) { create :item }
  
  before do
    login_user(user)
    click_on "アイテムを追加"
    fill_in "キーワードを2文字以上入力", with: item.name
    click_on "商品を検索"
  end

  describe "Wantランキング" do
    context "今欲しいボタンを押す" do
      it "ランキングが表示される" do
        click_on "今欲しい", match: :first
        click_on "Wantランキング"
        expect(page).to have_content "1位: 1 Wants"
        click_on "Ruby", match: :first
        expect(current_path) == "http://localhost:3000/items/book:18852922"
      end
    end
  
    context "いらないボタンを押す" do
      it "ランキングが表示されない" do
        click_on "今欲しい", match: :first
        click_on "いらない", match: :first
        click_on "Wantランキング"
        expect(page).not_to have_content "1位: 1 Wants"
      end
    end
  end
end