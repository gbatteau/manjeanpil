class PostsController < ApplicationController
    def create
      
      @post = Post.create(post_params)
      
      redirect_to root_path

    end
    
    private
    
    def post_params
      params.require(:post).permit(:description, :image, :restaurant_name, :prices, :address, :specials, :expire, :user_id)
    end
end
