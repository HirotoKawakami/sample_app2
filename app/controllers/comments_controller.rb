class CommentsController < ApplicationController
    before_action :logged_in_user

    def new
        @micropost = Micropost.find(params[:micropost_id])
    end

    def create
        @micropost = Micropost.find(params[:micropost_id])
        @comment = @micropost.comments.build(comment_params)

        if @comment.save
            respond_to do |format|
                format.html { redirect_to request.referrer || root_url }
                format.js
            end
            @comment.reload
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment
            respond_to do |format|
                format.html { redirect_to request.referrer || root_url }
                format.js
            end
            @comment.reload
        end
       @comment.destroy
    end

    def reply
    end


    private

        def comment_params
            params.require(:comment).permit(:content).merge(user_id: current_user.id)
        end
end
