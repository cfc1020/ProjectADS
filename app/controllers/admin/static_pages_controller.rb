class Admin::StaticPagesController < ApplicationController
  load_and_authorize_resource class: Admin::StaticPagesController

  def adminka
  end
  
end
