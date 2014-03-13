class Admin::StaticPagesController < ApplicationController
  include Admin::StaticPagesHelper

  before_filter :verify_admin

  def adminka
  end
  
end
