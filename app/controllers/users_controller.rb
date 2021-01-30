# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
    @user = User.create(user_params)
    
    if @user.valid?
      token = encode_token(user_id: @user.id)
      render json: { user: @user, token: token }, status: :created
    else
      render json: { error: 'Invalid username or password' }, status: :bad_request
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:username])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :age)
  end
end
