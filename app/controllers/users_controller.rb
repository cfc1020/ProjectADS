class UsersController < ApplicationController
	#load_and_authorize_resource
  def show
  	@ads = Ad.paginate(:page => params[:page], :per_page => 5).
  		find_all_by_user_id(current_user.id)
  	render "ads/index"
  end
end
