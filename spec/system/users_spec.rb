require 'rails_helper'

RSpec.describe "Users", type: :system do
  
  let(:user) { build :user }
  
  context "新規登録をクリック" do
    it "新規登録ページに遷移" do
      visit root_path
      click_on "新規登録"
      expect(page).to have_content("新規登録")
    end
  end
 
  context "amazonListを始めるをクリック" do
    it "新規登録ページに遷移" do
      visit root_path
      click_on "amazonListを始める"
      expect(page).to have_content("新規登録")
    end
  end

  describe "ユーザー登録" do
    before do
      visit signup_path
      fill_in "お名前", with: name
      fill_in "メールアドレス", with: email
      fill_in "パスワード", with: password
      fill_in "パスワード(確認)", with: password_confirmation
      click_button "新規登録"
    end

    context "正しい値を入力した場合" do
      let(:name) { "tanaka taro" }
      let(:email) { "taro@example.com" }
      let(:password) { "password" }
      let(:password_confirmation) { "password" }

      it "ユーザーを登録できる" do
        expect(page).to have_content "登録に成功しました。"
      end
    end
    
    context "名前だけ入力されている場合" do
      let(:name) { "Sato hanako" }
      let(:email) { nil }
      let(:password) { nil }
      let(:password_confirmation) { nil }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end
    
    context "emailだけ入力されている場合" do
      let(:name) { nil }
      let(:email) { "suzuki@abc.gmail.com" }
      let(:password) { nil }
      let(:password_confirmation) { nil }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end
   
    context "パスワードだけ入力されている場合" do
      let(:name) { nil }
      let(:email) { nil }
      let(:password) { "abcdefg" }
      let(:password_confirmation) { nil }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end
     
    context "パスワード(確認)だけ入力されている場合" do
      let(:name) { nil }
      let(:email) { nil }
      let(:password) { nil }
      let(:password_confirmation) { "123456" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end
     
    context "名前とemailだけ入力されている場合" do
      let(:name) { "Yamada Taro" }
      let(:email) { "yamada@test.ne.jp" }
      let(:password) { nil }
      let(:password_confirmation) { nil }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end
     
    context "名前とパスワードだけ入力されている場合" do
      let(:name) { "Kato ichiro" }
      let(:email) { nil }
      let(:password) { "1qaz2wsx" }
      let(:password_confirmation) { nil }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end
    
    context "名前とパスワード(確認)だけ入力されている場合" do
      let(:name) { "hayshi jiro" }
      let(:email) { nil }
      let(:password) { nil }
      let(:password_confirmation) { "example" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end
  
    context "emailとパスワードだけ入力されている場合" do
      let(:name) { nil }
      let(:email) { "123@d.com" }
      let(:password) { "1234567" }
      let(:password_confirmation) { nil }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end

    context "emailとパスワード(確認)だけ入力されている場合" do
      let(:name) { nil }
      let(:email) { "exmple@example.co.jp" }
      let(:password) { nil }
      let(:password_confirmation) { "12121212" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end

    context "パスワードとパスワード(確認)だけ入力されている場合" do
      let(:name) { nil }
      let(:email) { nil }
      let(:password) { "abc123" }
      let(:password_confirmation) { "abc123" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end
    
    context "名前のみ入力されていない場合" do
      let(:name) { nil }
      let(:email) { "yamada@yahoo.co.jp" }
      let(:password) { "test123" }
      let(:password_confirmation) { "test123" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end

    context "emailのみ入力されていない場合" do
      let(:name) { "yamada sinichiro" }
      let(:email) { nil }
      let(:password) { "aiueokaki" }
      let(:password_confirmation) { "aiueokaki" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end
    
    context "パスワードのみ入力されていない場合" do
      let(:name) { "kato yuki" }
      let(:email) { "kato@outlook.com" }
      let(:password) { nil }
      let(:password_confirmation) { "katoyuki" }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end

    context "パスワード(確認)のみ入力されていない場合" do
      let(:name) { "suzuki ai" }
      let(:email) { "suzuki@ai.com" }
      let(:password) { "SUzuki$123" }
      let(:password_confirmation) { nil }
      
      it "エラーメッセージが表示される" do
        expect(page).to have_content "ユーザの登録に失敗しました。"
      end
    end
  end
end