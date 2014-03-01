class PicturesController < ApplicationController
  def create
  	@picture.save
  end

  def destroy
  end
end
