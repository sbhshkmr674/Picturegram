class CommentsController < ApplicationController

	before_action :set_post

	def index
		#@comments=Comment.all
	end

	def new
		#@post=Post.find(params[:post_id])
		#@comment=@post.new
	end

	
	def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "Check the comment form, something went wrong."
      render root_path
    end
  end

	def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.delete
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

	def show 
		#@comment=Comment.new
	end
private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_post
		@post=Post.find(params[:post_id])
	end
end
