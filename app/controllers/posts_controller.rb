class PostsController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @posts = Post.includes(:user).order('id DESC').limit(20)
  end
  
  def new
  end
  
  def create
    Post.create(title: post_params[:title], content: post_params[:content], user_id: current_user.id, image: post_params[:image])
    redirect_to("/")
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
    post.update(post_params)
    redirect_to("/posts/#{params[:id]}")
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to("/")
  end
  
  private
  def post_params
    params.permit(:title, :content, :image)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
