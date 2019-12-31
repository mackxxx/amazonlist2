require 'rails_helper'

RSpec.describe "Wants", type: :system do
  let(:user) { create(:user, name: "user1") }
  let(:item) { create(:item, name: "プロを目指す人のためのRuby入門 言語仕様からテスト駆動開発・デバッグ技法まで （Software　Design　plusシリーズ） [ 伊藤淳一（プログラミング ]") }
  
  let(:user_a) { create(:user_a, name: "user2") }
  
  let(:user_b) { create(:user_b, name: "user3") }
  let(:item_b) { create(:item_b, name: "現場で使える Ruby on Rails 5速習実践ガイド [ 大場寧子 ]") }

  let(:user_c) { create(:user_c, name: "user4") }

  let(:user_d) { create(:user_d, name: "user5") }
  let(:item_d) { create(:item_d, name: "ゼロからわかるRuby超入門 はじめてのプログラミング （かんたんIT基礎講座） [ 五十嵐邦明 ]") }
  
  before do
    user.want(item)
    user_a.want(item)
    user_b.want(item_b)
    user_c.want(item)
    user_d.want(item_d)
    login_user(user_d)
    click_on "Wantランキング"
  end

  describe "ランキングの表示" do
    it "意図したランキングの順序になっている" do
      within '.test-for-item' do
      expect(page.text).to match %r{#{item.name}.*#{item_b.name}*#{item_d.name}}
      expect(page).to have_content "プロを目指す人のためのRuby入門 言語仕様からテスト駆動開発・デバッグ技法まで （Software　Design　plusシリーズ） [ 伊藤淳一（プログラミング ]"
      expect(page).to have_content "1位: 3 Wants"
      expect(page).to have_content "現場で使える Ruby on Rails 5速習実践ガイド [ 大場寧子 ]"
      expect(page).to have_content "2位: 1 Wants"
      expect(page).to have_content "ゼロからわかるRuby超入門 はじめてのプログラミング （かんたんIT基礎講座） [ 五十嵐邦明 ]"
      expect(page).to have_content "3位: 1 Wants"
      end
    end
  end
end