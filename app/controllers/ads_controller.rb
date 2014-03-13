class AdsController < ApplicationController

  load_and_authorize_resource

  skip_before_filter :authenticate_user! , :only => [:index]

  responders :flash, :http_cache

  def index
    @q = Ad.search(params[:q])
    @ads = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 5).
      published
  end

  def new
    @ad.pictures.build
  end

  def create
    @ad.user = current_user
    respond_with(@ad) do |format|
      if @ad.save
        format.html { redirect_to action: 'index' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
  end

  def update
    respond_with(@ad) do |format|
      if @ad.update_attributes(params[:ad])
        format.html { redirect_to ads_path }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @ad.destroy
    respond_with(@ad) do |format|
      format.html { redirect_to ads_path }
    end
  end

  def transfer_state
    @ad.send(params[:transfer_method])
  end
end
