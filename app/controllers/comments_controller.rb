class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token

  def index
    
  end
	
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build({body: params["comment"],user_id: current_user.id})
    if @comment.save
    @comment
    else
      flash[:danger] = "Comment not saved"
      redirect_to article_path(@article)
    end
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
	
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
  
end
