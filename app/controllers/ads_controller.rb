class AdsController < ApplicationController
  def index
  	@ads = Ad.all 
    @ads = Ad.paginate(:page => params[:page], :per_page => 5)
  end

  def new
  	if signed_in?
  		@ad = current_user.ads.build
      @ad.pictures.build
  	else
  		redirect_to new_user_session_path
  	end
  end

  def create
  	@ad = current_user.ads.build(params.require(:ad).permit(:content))
    @ad.picture.url = params[:picture].url
    if @ad.save
      flash[:notice] = params[:picture] #'OK!!!'
      redirect_to action: 'index'
    else
      render :action => "new"
    end
  end
end
