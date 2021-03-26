class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  # @param [User] user
  def current_user=(user)
    cookies.signed[:user_id] = user&.id
  end

  def current_user
    @current_user ||= Database::Users::Find.call(cookies.signed[:user_id])
  end
end
