class Admin::StaticPagesController < ApplicationController
  #load_and_authorize_resource class: Admin::StaticPagesController

  before_filter :verify_admin

  def verify_admin
    :authenticate_user!
    redirect_to root_url unless current_user && current_user.role.admin?
  end

  def adminka
  end
  
end
