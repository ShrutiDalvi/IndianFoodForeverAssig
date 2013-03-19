class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def list
    @recipe = Recipe.find_all_by_category_id(params[:id])
  end
end
