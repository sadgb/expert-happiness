module ApplicationHelper

  def current_user
    @current_user ||= Database::Users::Find.call(cookies.signed[:user_id])
  end
  
end
