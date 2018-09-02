class HomeController < ApplicationController
   #コントローラーに設定して、ログイン済ユーザーのみにアクセスを許可する
  before_action :forbid_login_user, {only: [:top]}
  
  
  def top
  end
  
  def about
  end
end
