class AdsController < ApplicationController

  load_and_authorize_resource

  skip_before_filter :authenticate_user! , :only => [:index]

  responders :flash, :http_cache

  def index
    @ads = Ad.paginate(:page => params[:page], :per_page => 5).
      published.includes(:pictures, :type, :user, :images)
  end

  def show
    @comment = Comment.new
  end

  # GET /articles/search
  def search
    @ads = Ad.search(params[:q]).records.paginate(:page => params[:page], :per_page => 5).
      published.includes(:pictures, :type, :user, :images)

    render action: "index"
  end

  def new
    @ad.pictures.build
  end

  def create
    @ad.user = current_user
    @ad.save
    respond_with(@ad)
  end

  def edit
  end

  def update
    @ad.update_attributes(params[:ad])
    respond_with(@ad)
  end

  def destroy
    @ad.destroy
    respond_with(@ad)
  end

  def transfer_state
    @ad.send(params[:transfer_method])
  end
end
