class PostsController < ApplicationController
  
  before_action :authenticate_user
  
  
  def index
  @posts = Post.all.order(created_at: :desc)
  end
  
  def show 
    @post = Post.find_by(id: params[:id])
  end
  
  def new 
    @post = Post.new
  end
  
  def create 
    #ファームから送信されたデータを受け取り、保存する処理
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
      )
    
    if @post.save
      # 変数flash[:notice]にメッセージを代入
      flash[:notice] = "投稿完了しました"
      redirect_to("/posts/index")
    else
     render("posts/new")
    end
    
  end
  
  
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    
    if
    @post.save
    # 変数flash[:notice]にメッセージを代入
    flash[:notice] = "投稿を編集しました"
    redirect_to("/posts/index")
    else
    
    #editアクションを経由せずにedit.html.erbを直接表示できる
    render("posts/edit")
    end
  
  end
  
  
  def destroy
    @post = Post.find_by(id: params[:id])
    if
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    end
    redirect_to("/posts/index")
  end
  
end
