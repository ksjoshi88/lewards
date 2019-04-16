class ApplicationController < ActionController::Base

  def authenticate_admin
    unless current_user.is_admin?
      redirect_to root_path, alert: "You do not have the access for that page"
    end
  end

end
