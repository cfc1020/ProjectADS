class Admin::TypesController < ApplicationController
  load_and_authorize_resource
  
  responders :flash, :http_cache

  def create
    @type = Type.new(name: params[:type][:name])
    respond_with(@type) do |format|
      if @type.save
        format.html { redirect_to(admin_types_path) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @type.destroy
    respond_with(@type) do |format|
      format.html { redirect_to(admin_types_path) }
    end
  end

  def update
    respond_with(@type) do |format|
      if @type.update_attributes(params[:type])
        format.html { redirect_to(admin_types_path) }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
