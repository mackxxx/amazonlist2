require 'rails_helper'

RSpec.describe "Wants", type: :system do
  
  let(:user) { create :user }
  let(:item) { create :item }
  let(:other_user) { create :other_user }
  let(:item) { create :item }
  let(:other_users) { create :other_users }
  let(:other_item) { create :other_item }
  let(:the_other_user) { create :the_other_user }
  let(:item) { create :item }
  
  before do
    user.want(item).save
    other_user.want(item).save
    other_users.want(other_item).save
    the_other_user.want(item).save
    login_user(the_other_user)
  end

  describe "意図したランキングの表示" do
    context "1位: 3 Wants、2位: 1 Wants　にする" do
      it "1位: 3 Wantsにプロを目指す人のためのRuby入門が表示される、2位: 1 Wantsに現場で使える Ruby on Rails 5速習実践ガイド [ 大場寧子 ]が表示される" do
      click_on "Wantランキング"
      expect(page).to have_content "プロを目指す人のためのRuby入門 言語仕様からテスト駆動開発・デバッグ技法まで （Software　Design　plusシリーズ） [ 伊藤淳一（プログラミング） ]"
      expect(page).to have_content "1位: 3 Wants"
      expect(page).to have_content "現場で使える Ruby on Rails 5速習実践ガイド [ 大場寧子 ]"
      expect(page).to have_content "2位: 1 Wants" 
      end
    end
  end
end