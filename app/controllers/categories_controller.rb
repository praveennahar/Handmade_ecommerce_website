class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @cloths = Category.find(1).subcategories
    @electric = Category.find(5).subcategories
  end
  def show
    @category = Category.find(params[:id])
  end


end
