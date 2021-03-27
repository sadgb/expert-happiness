# frozen_string_literal: true

class UsersController < ApplicationController

  def index
    @users = Database::Users::All.call
  end

  def show
    @user = Database::Users::Find.call(params[:id])
    head 404 unless @user
  end

  def signin_page
    @user = User.new
  end

  def signin
    @user = Database::Users::FindBy.call(email: params[:email])
    if CheckPasswordService.call(@user&.password_hash, params[:password])
      self.current_user=@user
      redirect_to user_path(@user.id), notice: 'User signed in.'
    else
      @error = 'Invalid email/password pair'
      @user = User.new
      @user.email = params[:email]
      render :signin_page, status: :unprocessable_entity
    end
  end

  def signup_page
    @user = User.new
  end

  def signout
    self.current_user=nil
    redirect_to root_path
  end

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
