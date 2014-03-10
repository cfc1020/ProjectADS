class Admin::UsersController < ApplicationController
	load_and_authorize_resource

  def index
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Ok update!"
      redirect_to admin_users_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end
end
