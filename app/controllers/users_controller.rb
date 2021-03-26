# frozen_string_literal: true

class UsersController < ApplicationController

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /signin
  def signin
    @user = User.new
  end

  def signup_page
    @user = User.new
  end

  # POST /users or /users.json
  def signup
    @user = ::UserSignInService.call(
      params[:name],
      params[:surname],
      params[:gender],
      params[:age],
      params[:password]
    )

    if @user.persisted?
      redirect_to user_path(@user.id), notice: 'User was successfully created.'
    else
      render :signup_page, status: :unprocessable_entity
    end
  end

end
