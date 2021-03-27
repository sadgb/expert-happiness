class FriendRequestsController < ApplicationController
  before_action :authenticate

  def add
    user_id = validate_user_id
    return unless user_id

    if AddFriendService.call(current_user, user_id)
      redirect_back fallback_location: root_path, notice: 'Success'
    else
      redirect_back fallback_location: root_path, alert: 'unknown error'
    end
  end

  def remove
    user_id = validate_user_id
    return unless user_id

    if RemoveFriendService.call(current_user, user_id)
      redirect_back fallback_location: root_path, notice: 'Success'
    else
      redirect_back fallback_location: root_path, alert: 'unknown error'
    end

  end

  private
  def validate_user_id
    user_id = params[:user_id].to_i
    if user_id <= 0 || user_id == current_user.id
      redirect_back fallback_location: root_path, alert: 'invalid user_id'
      nil
    else
      user_id
    end
  end
end
