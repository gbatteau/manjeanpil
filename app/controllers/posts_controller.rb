class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:edit, :update]

  def index
    if(params.has_key?(:special_type))
      @posts = Post.where(special_type: params[:special_type]).order("created_at desc")
    else
      @posts = Post.all.order("created_at desc")
    end
  end

  def new
    @post = Post.new
  end

  def create
    if current_user.profile
      @post           = Post.new(post_params)
      @post.user_id   = current_user.id
      @post.street    = current_user.profile.street
      @post.city      = current_user.profile.city
      @post.state     = current_user.profile.state
      @post.zipcode   = current_user.profile.zipcode
      @post.latitude  = current_user.profile.latitude
      @post.longitude = current_user.profile.longitude

      if @post.save
        redirect_to post_path(@post)
      else
        redirect_to root_path
      end
    end
  end

  def edit
  end

  private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(
          :description,
          :image,
          :latitude,
          :longitude,
          :restaurant_name,
          :street,
          :prices,
          :address,
          :city,
          :state,
          :zipcode,
          :special_type,
          :specials,
          :expire,
          :user_id
        )
      end
end
