class Admin::UsersController < ApplicationController
	load_and_authorize_resource
  responders :flash, :http_cache

  def index
  end

  def edit
  end

  def update
    @user.role = params[:user][:role]
    @user.attributes = params[:user]
    respond_with(@user) do |format|
      if @user.save
        format.html { redirect_to admin_users_path }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @user.destroy
    respond_with(@user) do |format|
      format.html { redirect_to admin_users_path }
    end
  end
end
