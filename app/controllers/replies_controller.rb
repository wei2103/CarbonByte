class RepliesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    puts params["message"]
    @reply = @post.replies.new(message: params[:reply][:message], user_id: current_user.id)
    if @reply.save
      redirect_to @post, notice: 'Reply was successfully created.'
    else
      # If the reply is not saved, it will show an error message
      redirect_to @post, notice: "Reply was not saved. #{@reply.errors.full_messages[0]}."
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:message)
  end
end
