class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.where(user_id: @user.id).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.where(post_id: @post.id).order(created_at: :desc)
  end
end
