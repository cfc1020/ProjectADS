class AdsController < ApplicationController
  def index
    @ads = Ad.paginate(:page => params[:page], :per_page => 5)
  end

  def new
  	if signed_in?
  		@ad = current_user.ads.build
  	else
  		redirect_to new_user_session_path
  	end
  end

  def create
  	@ad = current_user.ads.build(params.require(:ad).permit(:content))
    @ad.pictures_attributes = params[:ad][:pictures_attributes]

    if @ad.save
      flash[:notice] = 'OK!!!'
      redirect_to action: 'index'
    else
      render :action => "new"
    end
  end

  def transfer_state
    @ad = Ad.find(params[:id])
    @ad.send(params[:transfer_method])
    redirect_to action: 'index'
  end
end
