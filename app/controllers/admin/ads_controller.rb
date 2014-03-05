class Admin::AdsController < ApplicationController
	include Admin::StaticPagesHelper
	#load_and_authorize_resource
	before_filter :verify_admin

	def moderate
    	@ads = Ad.paginate(:page => params[:page], :per_page => 5).
    		find_all_by_state("pending")
    	render "ads/index"
	end
end
