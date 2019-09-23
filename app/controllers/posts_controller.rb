class PostsController < ApplicationController
    def create
    if current_user.profile
      @post = Post.create(post_params)
    end
      redirect_to root_path

    end
   
   
    def index
      if(params.has_key?(:special_type))
        @posts = Post.where(special_type: params[:special_type]).order("created_at desc")
      else
        @posts = Post.all.order("created_at desc")
      end
    end
   
   
   
   
    
    
    private
    
    def post_params
      params.require(:post).permit(:description, :image, :latitude, :longitude, :restaurant_name, :street, :prices, :address, :city, :state, :zipcode, :special_type, :specials, :expire, :user_id)
    end
end
