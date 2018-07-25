class PostsController < ApplicationController
  def index
  @posts = Post.all.order(created_at: :desc)
  end
  
  def show 
    @post = Post.find_by(id: params[:id])
  end
  
  def new 
    
  end
  
  def create 
    #ファームから送信されたデータを受け取り、保存する処理
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end
  
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/posts/index")
  end
  
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
  
end
