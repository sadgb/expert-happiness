# frozen_string_literal: true

class UsersController < ApplicationController

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = Database::Users::Find.call(params[:id])
    head 404 unless @user
  end

  # GET /signin
  def signin
    @user = User.new
  end

  def signup_page
    @user = User.new
  end

  # POST /users or /users.json
  def signup
    @user = ::UserSignUpService.call(
      params[:email],
      params[:name],
      params[:surname],
      params[:gender],
      params[:age],
      params[:password]
    )

    if @user.persisted?
      # запоминаем текущего юзера
      self.current_user = @user
      redirect_to user_path(@user.id), notice: 'User was successfully created.'
    else
      render :signup_page, status: :unprocessable_entity
    end
  end

end
