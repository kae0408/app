class UsersController < ApplicationController
  def index
     @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      # 引数を追加し、初期画像が設定されるようにしてください
      image_name: "default_user.jpg"
    )
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
  
end
