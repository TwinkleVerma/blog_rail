class LikesController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  include LikeHelper

  def index
  end

  def create
    if params[:like_type].present? && params[:like_id].present?
      article_or_comment_classname = params[:like_type].constantize
      @likeable_entity = article_or_comment_classname.find_by_id(params[:like_id])
      @like = @likeable_entity.likes.build(user_id: current_user.id) if @likeable_entity.present?
    else
      flash[:danger] = "Can't like #{params[:like_type]}"
    end
  end

  def destroy
    if params[:like_type].present? && params[:like_id].present?
      article_or_comment_classname = params[:like_type].constantize
      @likeable_entity = article_or_comment_classname.find_by_id(params[:like_id])
      @like = @likeable_entity.likes.find(params[:id]) if @likeable_entity.present?
    else
      flash[:danger] = "Can't unlike #{params[:like_type]}"
    end
  end
end