require 'rails_helper'

RSpec.feature "UserPages", type: :feature do
  describe "新規登録 page" do
    before do
      visit signup_path
    end

    it "should have the content '新規登録'" do
      expect(page).to have_content "新規登録"
    end
  end
end