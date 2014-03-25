class Admin::AdsController < ApplicationController
  include Admin::StaticPagesHelper
	
  before_filter :verify_admin

  def moderate
    @ads = Ad.paginate(:page => params[:page], :per_page => 5).
      pending.includes(:pictures, :type, :user, :images)
    render "ads/index"
  end
end
