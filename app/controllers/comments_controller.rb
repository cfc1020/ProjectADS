class CommentsController < ApplicationController 
  load_and_authorize_resource

  enable_sync only: [:create, :update, :destroy]

  def create
    @ad = Ad.find(params[:ad_id])
    @comment.ad = @ad
    @comment.user = current_user
    respond_with(@comment) do |format|
      if @comment.save
        UserMailer.notification_for_new_comment_for_ad(@ad, current_user).deliver
        sync_new @comment, scope: @ad
        format.html { redirect_to @ad }
      else
        format.html { render :action => "edit" }
      end 
    end
  end

  def edit
    @ad = Ad.find(params[:ad_id])
  end

  def update
    @ad = Ad.find(params[:ad_id])
    respond_with(@comment) do |format|
      if @comment.update_attributes(params[:comment])
        sync_update @comment
        format.html { redirect_to @ad }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    sync_destroy @comment if @comment.destroy
    respond_with(@comment) do |format|
      format.html { redirect_to ad_path(Ad.find(params[:ad_id])) }
    end
  end
end
