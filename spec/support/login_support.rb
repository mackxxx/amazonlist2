module LoginSupport
  def login_user
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    click_on "アイテムを追加"
    fill_in "キーワードを2文字以上入力", with: item.name
    click_on "商品を検索"
  end
end

RSpec.configure do|config|
  config.include LoginSupport
end
