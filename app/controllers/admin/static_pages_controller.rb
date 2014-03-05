class Admin::StaticPagesController < ApplicationController
	include Admin::StaticPagesHelper
  #load_and_authorize_resource class: Admin::StaticPagesController

  before_filter :verify_admin

  

  def adminka
  end
  
end
