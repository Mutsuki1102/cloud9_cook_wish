class LikesController < ApplicationController
  before_action :user_signed_in?

  def like
    @post = Post.find(params[:post_id])

    unless @post.iiyome?(current_user)
      @post.iiyome(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def unlike
    @post = Post.find(params[:post_id])

    if @post.iiyome?(current_user)
      @post.uniiyome(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
