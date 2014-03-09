class AdsController < ApplicationController

  load_and_authorize_resource

  skip_before_filter :authenticate_user! , :only => [:index]

  def index
    @q = Ad.search(params[:q])
    @ads = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 5).
      find_all_by_state("published")
  end

  def new
    @ad.pictures.build #current_user.ads.build
  end

  def create
    @ad.user = current_user
    if @ad.save
      flash[:notice] = 'OK!!!'
      redirect_to action: 'index'
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @ad.update_attributes(params[:ad]) 
      flash[:notice] = 'OK!.'
      redirect_to ads_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @ad.destroy
    redirect_to ads_path
  end

  def transfer_state
    @ad.send(params[:transfer_method])
  end
end
