class Admin::TypesController < ApplicationController
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
  	@type.destroy

    redirect_to(admin_types_path)
  end

  def update
  	if @type.update_attributes(params[:type])
  		flash.now[:notice] = 'OK.'
     	redirect_to(admin_types_path)
    else
      	render :action => "new"
    end
  end
end
