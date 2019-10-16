class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  # end

  def create
    comment_ps = comment_params()
    if comment_ps[:user_attributes][:username] == ""
      comment_ps.delete(:user_attributes)
    end
    comment = Comment.create(comment_ps)
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
