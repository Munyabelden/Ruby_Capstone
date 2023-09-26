class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users
  end

  def create
    @users = User.new(user_params)
    
end
