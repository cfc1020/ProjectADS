class AdsController < ApplicationController
  def index
  	@ads = Ad.all 
  end

  def new
  	@ad = current_user.ads.build 
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
