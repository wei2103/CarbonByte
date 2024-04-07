class PostsController < ApplicationController
  def index
    @posts = Post.all

    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)

    if post.save
      redirect_to post
    else
      render :new
    end
  end
end
