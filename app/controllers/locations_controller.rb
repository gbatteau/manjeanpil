class LocationsController < ApplicationController
  def index
    if params[:location].present?
      @posts = Post.near(params[:location], 50)
    elsif current_user && current_user.lat && current_user.long
      @posts = Post.near([current_user.lat, current_user.long], 50)
    else
      @posts = Post.last(20)
    end
  end
end
