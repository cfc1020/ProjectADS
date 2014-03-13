class Admin::AdsController < ApplicationController
	include Admin::StaticPagesHelper
	
	before_filter :verify_admin

	def moderate
    	@q = Ad.search(params[:q])
  		@ads = @q.result.paginate(:page => params[:page], :per_page => 5).
    		pending
    	render "ads/index"
	end
end
