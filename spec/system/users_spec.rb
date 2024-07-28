require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
  
    # サインインページへ移動する
    visit  new_user_session_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(page).to have_current_path(new_user_session_path)

    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password

    # ログインボタンをクリックする
    click_on('Log in')
    sleep 1

    # トップページに遷移していることを確認する
     expect(page).to have_current_path(root_path)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    
    # トップページに遷移する
    @user = FactoryBot.create(:user)
    
    # ログインしていない場合、サインインページに遷移していることを確認する
    @user = FactoryBot.create(:user)
   
    # 誤ったユーザー情報を入力する
    @user = FactoryBot.create(:user)
    @user = FactoryBot.create(:user)
   
    # ログインボタンをクリックする
    @user = FactoryBot.create(:user)

    # サインインページに戻ってきていることを確認する
    @user = FactoryBot.create(:user)

  end
end