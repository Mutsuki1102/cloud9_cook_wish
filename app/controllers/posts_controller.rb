class PostsController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show, :lp]

  def lp
  end
  
  def index
    @posts = Post.includes(:user).order('id DESC').limit(20)
  end
  
  def calendar
    @posts = Post.includes(:user).where(user: current_user).order('id DESC').limit(20)
  end
  
  def new
  end
  
  def create
    Post.create(title: post_params[:title], content: post_params[:content], user_id: current_user.id, image: post_params[:image], start_time: post_params[:start_time])
    redirect_to("/posts/index")
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
    redirect_to("/posts/index")
  end

  def search
    @posts = Post.where('title Like(?)', "%#{params[:keyword]}%").limit(20)
  end
  
  private
  def post_params
    params.permit(:title, :content, :image, :start_time)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


end
