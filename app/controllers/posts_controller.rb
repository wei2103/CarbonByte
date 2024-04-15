class PostsController < ApplicationController
  before_action :authenticate_user!

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
    # Create a new post for the current user
    post = current_user.posts.new(post_params)

    if post.save
      redirect_to post, notice: 'Post was successfully created.'
    else
      @posts = Post.all  # Fetch all posts again to display in the index view
      @post = post  # Create a new post object to pass to the index view
      render :index, status: :unprocessable_entity, notice: 'Post was not saved.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
