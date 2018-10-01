class RelationshipsController < ApplicationController
    before_action :logged_in_user, only:[:create, :destroy]

    # ビューで変数を扱うため、userを@userにする必要がある
    def create
        @user = User.find(params[:followed_id])
        current_user.follow(@user)
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end
    end

    def destroy
        @user = Relationship.find(params[:id]).followed
        current_user.unfollow(@user)
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end
    end
    
end
