module Admin::StaticPagesHelper
  def verify_admin
    :authenticate_user!
    redirect_to root_url unless current_user && current_user.role.admin?
  end
end
