require 'rails_helper'

RSpec.describe "Desires", type: :system do
  let(:users) { create_list(:user, 6) }
  
  let(:item_a) { create(:item, name: "プロを目指す人のためのRuby入門 言語仕様からテスト駆動開発・デバッグ技法まで （Software　Design　plusシリーズ） [ 伊藤淳一（プログラミング） ]") }
  let(:item_b) { create(:item, name: "現場で使える Ruby on Rails 5速習実践ガイド [ 大場寧子 ]") }
  let(:item_c) { create(:item, name: "ゼロからわかるRuby超入門 はじめてのプログラミング （かんたんIT基礎講座） [ 五十嵐邦明 ]") }
  
  before do
    users[0].desire(item_c)
    users[1].desire(item_c)
    users[2].desire(item_c)
    
    users[3].desire(item_a)
    
    users[4].desire(item_b)
    users[5].desire(item_b)
    login_user(users[0])
    click_on "Desireランキング"
  end

  describe "ランキングの表示" do
    it "意図したランキングの順序になっている" do
      within '.test-for-desire' do
        ranking_item_titles = all(".item-title").map(&:text)
        expect_titles = [
          "ゼロからわかるRuby超入門 はじめてのプログラミング （かんたんIT基礎講座） [ 五十嵐邦明 ]",
          "現場で使える Ruby on Rails 5速習実践ガイド [ 大場寧子 ]",
          "プロを目指す人のためのRuby入門 言語仕様からテスト駆動開発・デバッグ技法まで （Software　Design　plusシリーズ） [ 伊藤淳一（プログラミング） ]",
        ]
        expect(ranking_item_titles).to eq expect_titles
      end
    end
  end
end