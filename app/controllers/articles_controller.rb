class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  include ArticlesHelper

  def new
    @user = User.new
		@article = Article.new
	end

	def edit
  end

  def create
    @article = current_user.articles.create(article_params)
 	  if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to @article
  	else
      flash[:success] = "Article was not created"
      render 'new'
  	end
	end

	def update
	  if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to @article
    else
      flash[:failure] = "Can't update article"
      render 'edit'
    end
	end

  def show
	end
  	
  def index
    @article = Article.all
  end
  
  def destroy
    if @article.destroy
      flash[:danger] = "Article was successfully deleted"
    else
      flash[:danger] = "Can't delete article"
    end
    redirect_to articles_path
	end
  
  private
  
  def set_article
    @article = Article.find_by_id(params[:id])
    if @article.blank?
      false
    end
  end
  def article_params
    params.require(:article).permit(:title, :text, :category_id)
  end
  
end