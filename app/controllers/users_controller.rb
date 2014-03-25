class UsersController < ApplicationController
  def show
  	@ads = Ad.paginate(:page => params[:page], :per_page => 5).
  		where(user_id: current_user.id).includes(:pictures, :type, :user)
  	render "ads/index"
  end
end
