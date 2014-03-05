class AdsController < ApplicationController

  load_and_authorize_resource

  skip_before_filter :authenticate_user! , :only => [:index]

  #before_action :get_ad, :only => [:edit, :destroy, :update, :transfer_state]

  def index
    @ads = Ad.paginate(:page => params[:page], :per_page => 5).
      find_all_by_state("published")
  end

  def new
    if signed_in?
      @ad = Ad.new
      @ad.pictures.build #current_user.ads.build
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @ad = current_user.ads.build(params.require(:ad).permit(:content, :type_id))
    if !params[:ad][:pictures_attributes].nil?
      @ad.pictures_attributes = params[:ad][:pictures_attributes]
    end



    if @ad.save
      flash[:notice] = 'OK!!!'
      redirect_to action: 'index'
    else
      render :action => "new"
    end
  end

  def edit
    #@ad = Ad.find(params[:id])
  end

  def update
    #@ad = Ad.find(params[:id])
    if @ad.update_attributes(params[:ad])
      flash[:notice] = 'OK!.'
      redirect_to ads_path
    else
      render :action => "edit"
    end
  end

  def destroy
    #@ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to ads_path
  end

  def transfer_state
    #@ad = Ad.find(params[:id])
    @ad.send(params[:transfer_method])
  end


  #private
# 
  #def get_ad
 #   @ad = Ad.find(params[:id])
  #end
end
