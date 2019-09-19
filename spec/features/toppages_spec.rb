require 'rails_helper'

RSpec.feature "Toppages", type: :feature do
 describe "Index page" do
  before do
    visit root_path   
  end
  
  it "should have the content 'Toppages#index'" do
    expect(page).to have_content "新規登録 ログイン 探しものは何ですか amazonListを始める Twitterアカウントでログイン © 2019 amazonlist2."
  end
 end
end