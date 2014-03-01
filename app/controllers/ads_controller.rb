class AdsController < ApplicationController
  def index
  	@ads = Ad.all 
  end

  def new
  	if signed_in?
  		@ad = current_user.ads.build if signed_in?
  	else
  		redirect_to new_user_session_path
  	end
  end

  def create
  	@ad= current_user.ads.build(params.require(:ad).permit(:content))
    if @ad.save
      flash[:notice] = 'OK!!!'
      redirect_to action: 'index'
    else
      render :action => "new"
    end
  end
end
