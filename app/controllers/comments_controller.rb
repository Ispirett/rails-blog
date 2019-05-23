class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save
    redirect_to article_path(@comment.article_id)
  end

  def destroy

    @comment = Comment.find(params[:article_id])
    flash[:notice] = "your comment was deleted"
    @comment.destroy
    redirect_to article_path(@comment.article)
  end

  def show

  end


  private
  def comment_params
    params.require(:comment).permit(:aurthor_name, :body)
  end
end

