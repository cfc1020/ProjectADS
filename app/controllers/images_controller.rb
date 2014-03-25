class ImagesController < ApplicationController

  load_and_authorize_resource

  def destroy
    @image.destroy
    respond_with(@image) do |format|
      format.html { redirect_to edit_ad_path(Ad.find(params[:ad_id])) }
    end
  end
end
