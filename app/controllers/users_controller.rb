class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @posts = user.posts.order("created_at DESC")
  end
  
  def search
    user = User.find(params[:id])
    @nickname = current_user.nickname
    posts = user.posts.order("created_at DESC")
    @posts = posts.where('title Like(?)', "%#{params[:keyword]}%").limit(20)
  end
end

