module ProfileHelper
  def profile_name
    if current_user.profile.name.present?
      current_user.profile.name
    else
      current_user.email
    end
  end
end
