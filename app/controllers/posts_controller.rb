class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  # before_action :move_to_index, except: :index

  def index
    @posts = Post.includes(:user).order("id DESC").page(params[:page]).per(5)
  end

  def new
    @posts = Post.new
  end

  def create


    @post = Post.create(title: post_params[:title], content: post_params[:content], user_id: current_user.id)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.json
    end
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if post.user_id == current_user.id
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  private
    
  def post_params
    params.require(:post).permit(:title, :content)
  end
end