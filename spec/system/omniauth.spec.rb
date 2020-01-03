require "rails_helper"

describe "UserFeature" do
  before do
    OmniAuth.config.mock_auth[:twitter] = nil
    Rails.application.env_config['omniauth.auth'] = twitter_mock
    visit root_path
    click_on 'Twitterでログイン'
  end
  
  it "ログインできる" do
      expect(page).to have_content "Twitterでログインしました。"
  end
end