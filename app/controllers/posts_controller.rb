class PostsController < ApplicationController
    def create
      
      @post = Post.create(post_params)
      
      redirect_to root_path

    end
    
    
    #adding search radius
    def index
      if params[:search].present?
        @posts = Post.near(params[:search], 50, :order => :distance)
      else
        @posts = Post.all
      end
    end


    
    
    private
    
    def post_params
      params.require(:post).permit(:description, :image, :latitude, :longitude, :restaurant_name, :street, :prices, :address, :specials, :expire, :user_id)
    end
end
