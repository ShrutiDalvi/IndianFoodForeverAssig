class RecipiesController < ApplicationController
  def show
    @list = Recipe.all
  end

  def list
    @recipe = Recipe.find(params[:id])
    if @recipe.blank?
      redirect_to '/'
    end
  end
end

