class Api::V1::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all

    render json: @recipes
  end

  def show
    @recipe = Recipe.find_by(params[:id])

    if @recipe
      render json: @recipe
    else
      render json: @recipe.error, status: :not_found
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render json: @recipe, status: :create, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def update
    @recipe = Recipe.find_by(params[:id])

    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find_by(params[:id])
    @recipe.destroy
    head :no_content
  end

  private

  def recipe_params
    params.require(:recipes).permit(:user_id, :title, :description, :cooking_time, :photo, :public)
  end
end
