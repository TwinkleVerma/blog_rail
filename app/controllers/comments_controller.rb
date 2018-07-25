class CommentsController < ApplicationController

  skip_before_action :verify_authenticity_token
  include CommentsHelper
  
  def index
    
  end
	
  def create
    @article = Article.find(params[:article_id])
    if params[:article_id].present? && params[:body].present?
      @comment = @article.comments.build({body: params[:body],user_id: current_user.id})
      if @comment.save
        flash[:success] = "Comment saved"
        @comment
      else
        flash[:danger] = "Comment not saved"
        redirect_to article_path(@article)
      end
    else
      flash[:danger] = "Comment not saved"
      redirect_to article_path(@article)
    end
  end
  
  def destroy
    if params[:article_id].present? && params[:id].present?
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      if @comment.destroy
        flash[:danger] = "Comment deleted"
      else
        flash[:danger] = "Comment cannot deleted"
        redirect_to article_path(@article)
      end
    else
      flash[:danger] = "Comment cannot deleted"
      redirect_to article_path(@article)
    end
  end
	
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
  
end