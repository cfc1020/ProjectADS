class Admin::UsersController < ApplicationController
	load_and_authorize_resource

  before_action :get_user, :only => [:edit, :update, :destroy]

  def index
  	@users = User.all
  end

  def edit
  	
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Ok update!"
      redirect_to admin_users_path
    else
      render :action => "edit"
    end
  end


  private

  def get_user
    @user = User.find(params[:id])
  end

end
