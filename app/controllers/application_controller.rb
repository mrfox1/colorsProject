class ApplicationController < ActionController::Base
  def admin_user
    if current_user.present? && current_user.role == 'admin'
      true
    else
      redirect_to root_path
    end
  end
end
