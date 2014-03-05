class Admin::TypesController < ApplicationController
  load_and_authorize_resource
  
  def index
  	@types = Type.all
  end

  def new
  	@type = Type.new
  end

  def edit
  	@type = Type.find(params[:id])
  end

  def create
  	@type = Type.new(name: params[:type][:name])
  	if @type.save
  		flash.now[:notice] = 'OK.'
     	redirect_to(admin_types_path)
    else
      	render :action => "new"
    end
  end

  def destroy
  	@type = Type.find(params[:id])
  	@type.destroy

    redirect_to(admin_types_path)
  end

  def update
  	@type = Type.find(params[:id])
  	if @type.update_attributes(params[:type])
  		flash.now[:notice] = 'OK.'
     	redirect_to(admin_types_path)
    else
      	render :action => "new"
    end
  end
end
