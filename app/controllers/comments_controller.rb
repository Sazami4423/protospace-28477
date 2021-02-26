class CommentsController < ApplicationController

def create 
  @comment = Comment.new(comment_params)
  if @comment.save
    redirect_to prototype_path(@comment.prototype)
    # redirect_to "/prototype/#{comment.prototype.id}"  # コメントと結びつく投稿の詳細画面に遷移する
  else
    @prototype = @comment.prototype
    @comments = @prototype.comments
    render "prototypes/show"
  end
end

private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
