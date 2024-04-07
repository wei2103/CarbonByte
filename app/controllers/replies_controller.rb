class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    puts params["message"]
    @reply = @post.replies.new(message: params[:reply][:message])
    if @reply.save!
      redirect_to @post, notice: 'Reply was successfully created.'
    else
      render 'posts/show'
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:message)
  end
end
