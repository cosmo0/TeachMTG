module DecksHelper

  def user_is_admin
    if current_user && current_user.email == ENV['ADMIN_EMAIL']
      true
    else
      false
    end
  end

end
