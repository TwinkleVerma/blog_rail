class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def create
    @category = Category.new(article_params)
    if @category.save
      flash[:success] = "Category was successfully added"
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to categories_path
    else
      redirect_to edit_category_path
    end
  end
  
  def show
    @category = Category.find(params[:id])
  end

  def index
    @category = Category.all
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:danger] = "Category was successfully deleted"
    redirect_to categories_path
  end

  def article_params
    params.require(:category).permit(:name)
  end

end
