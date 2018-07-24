class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was successfully added"
      redirect_to categories_path
    else
      flash[:failure] = "Category not added"
      redirect_to new_category_path
    end
  end
  
  def category_params
    params.require(:category).permit(:name)
  end

end
