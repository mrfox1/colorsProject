module ApplicationHelper
  def admin?
    if current_user.present?
      current_user.role == 'admin'
    end
  end
end
