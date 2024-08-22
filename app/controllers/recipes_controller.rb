class RecipesController < ApplicationController
  def index
    @recipes = Recipe.search(params[:search] || '').order(:title).page(params[:page]).per(5)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
