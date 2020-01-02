require 'rails_helper'

RSpec.describe "Wants", type: :system do
  let(:users) { create_list(:user, 6) }
  
  let(:item_a) { create(:item, name: "プロを目指す人のためのRuby入門 言語仕様からテスト駆動開発・デバッグ技法まで （Software　Design　plusシリーズ） [ 伊藤淳一（プログラミング） ]") }
  let(:item_b) { create(:item, name: "現場で使える Ruby on Rails 5速習実践ガイド [ 大場寧子 ]") }
  let(:item_c) { create(:item, name: "ゼロからわかるRuby超入門 はじめてのプログラミング （かんたんIT基礎講座） [ 五十嵐邦明 ]") }
  
  before do
    users[0].want(item_a)
    users[1].want(item_a)
    
    users[2].want(item_b)
    users[3].want(item_b)
    users[4].want(item_b)
    
    users[5].want(item_c)
    login_user(users[0])
    click_on "Wantランキング"
  end

  describe "ランキングの表示" do
    it "意図したランキングの順序になっている" do
      within '.test-for-want' do
        ranking_item_titles = all(".item-title").map(&:text)
        expect_titles = [
          "現場で使える Ruby on Rails 5速習実践ガイド [ 大場寧子 ]",
          "プロを目指す人のためのRuby入門 言語仕様からテスト駆動開発・デバッグ技法まで （Software　Design　plusシリーズ） [ 伊藤淳一（プログラミング） ]",
          "ゼロからわかるRuby超入門 はじめてのプログラミング （かんたんIT基礎講座） [ 五十嵐邦明 ]",
        ]
        expect(ranking_item_titles).to eq expect_titles
      end
    end
  end
end