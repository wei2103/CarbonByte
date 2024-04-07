class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.create(reply_params)
    redirect_to post_path(@post)
  end

  private

  def reply_params
    params.require(:reply).permit(:name, :reply)
  end
end
