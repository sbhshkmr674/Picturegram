class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	def index
		@posts=Post.all
	end

	def new
		@post=Post.new
	end

	def create  
        @post = Post.create(post_params)
       	if @post.save
       flash[:success]="Your post is successfully uploded!"
       redirect_to posts_path
       else
        flash.now[:alert]="Something happing wrong"       
       	render :new
       end
    end 
    
    def show
    	#@post=Post.find(params[:id])
    end

    def edit
    	#@post=Post.find(params[:id])
    end
    
    def update
    	#@post=Post.find(params[:id])

    	 if @post.update(post_params)
    	 	flash[:success] ="Your post is successfully updated!!"
            redirect_to posts_path
         else
         	flash.now[:alert] = "Update failed.  Please check the form."
          render :edit
        end
     end

    def destroy
    	#@post=Post.find(params[:id])
    	@post.destroy
    	redirect_to posts_path
    end

    private

    def post_params  
         params.require(:post).permit(:image, :caption)
    end

    def set_post
    	@post=Post.find(params[:id])
    end
end
