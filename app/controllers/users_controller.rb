class UsersController < ApplicationController
  def show
  	@q = Ad.search(params[:q])
  	@ads = @q.result.paginate(:page => params[:page], :per_page => 5).
  		find_all_by_user_id(current_user.id)
  	render "ads/index"
  end
end
