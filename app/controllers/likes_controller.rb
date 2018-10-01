class LikesController < ApplicationController
  before_action :logged_in_user, only:[:create, :destroy]
  
  def create
    # ビューでオブジェクトとして操作するからmicropostを@micropostに変更する
    # Ajax使うときはrespond do |format|をコントローラーに入力する
    @micropost = Micropost.find_by(id: params[:micropost_id])
    @micropost.like(current_user)
    @micropost.reload
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def destroy
    # ビューでオブジェクトとして操作するからmicropostを@micropostに変更する
    # Ajax使うときはrespond do |format|をコントローラーに入力する
    @micropost = Like.find_by(id: params[:id]).micropost
    @micropost.unlike(current_user)
    @micropost.reload
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
