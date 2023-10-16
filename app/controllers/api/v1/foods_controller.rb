class Api::V1::FoodsController < ApplicationController

  def index
    @foods = Food.all

    render json: @foods
  end

  def show
    render json: @foods
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      render json: @food, status: :created, location: @foods
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  def updated
    @food = Food.find_by(params[:id])

    if @food.update(food_params)
      render json: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find_by(params[:id])
    @food.destroy
    head :no_content
  end

  private

  def food_params
    params.require(:foods).permit(:recipes_id, :quantity, :name)
  end
end
