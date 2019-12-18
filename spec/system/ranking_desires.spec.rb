require 'rails_helper'

RSpec.describe "Desires", type: :system do
  let(:user) { create :user }
  let(:item) { create :item }

  before do
    login_user(user)
    click_on "アイテムを追加"
    fill_in "キーワードを2文字以上入力", with: item.name
    click_on "商品を検索"
  end
  
  describe "Desireランキング" do
    context "後で欲しいボタンを押す" do
      it "ランキングが表示される" do
        click_on "後で欲しい", match: :first
        click_on "Desireランキング"
        expect(page).to have_content "1位: 1 Desires"
      end
    end
    
    context "いらないボタンを押す" do
      it "ランキングが表示されない" do
        click_on "今欲しい", match: :first
        click_on "いらない", match: :first
        click_on "Desireランキング"
        expect(page).not_to have_content "1位: 1 Desires"
      end
    end
  end
end