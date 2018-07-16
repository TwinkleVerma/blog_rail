class CategoriesController < ApplicationController
  def new
    @category = Category.new 
  end
	def create
    @category = Category.all(params[:name])
    @category.save
	end
  def index
    @categories = Category.all
  end
end
