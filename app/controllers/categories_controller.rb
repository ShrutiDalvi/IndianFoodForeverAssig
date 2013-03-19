class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def list
    @recipelist = Recipe.find_all_by_category_id(params[:id])
  end
end
