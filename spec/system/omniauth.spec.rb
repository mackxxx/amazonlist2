require "rails_helper"

describe "Omniauth" do
  before do
    OmniAuth.config.mock_auth[:twitter] = nil
    Rails.application.env_config['omniauth.auth'] = twitter_mock
    visit root_path
    click_on 'Twitterでログイン'
  end
  
  it "ログインできる" do
    expect(page).to have_content "Twitterでログインしました。"
    expect(page).to have_content "アイテムを追加"
  end
  
  it "ログアウトできる" do
    click_on 'ログアウト'
    expect(page).to have_content "ログアウトしました。"
    expect(page).to_not have_content "アイテムを追加"
  end
end