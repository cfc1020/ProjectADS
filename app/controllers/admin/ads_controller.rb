class Admin::AdsController < ApplicationController
	def moderate
    	@ads = Ad.paginate(:page => params[:page], :per_page => 5).
    		find_all_by_state("pending")
    	render "ads/index"
	end
end
