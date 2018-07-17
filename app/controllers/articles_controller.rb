class ArticlesController < ApplicationController
  
  def new
    @user = User.new
		@article = Article.new
	end

	def edit
    @article = Article.find(params[:id])
	end

  def create
    @article = current_user.articles.create(article_params)
 	  if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to @article
  	else
      render 'new'
  	end
	end

	def update
    @article = Article.find(params[:id])
		if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
    	redirect_to @article
    else
      render 'edit'
    end
	end

  def show
    @article = Article.find(params[:id])
	end
  	
  def index
    @article = Article.all
  end
  
  def destroy
    @article = Article.find(params[:id])
  	@article.destroy
    flash[:danger] = "Article was successfully deleted"
  	redirect_to articles_path
	end
  
  private
  	
  def article_params
    params.require(:article).permit(:title, :text, :category_id)
  end
  
end