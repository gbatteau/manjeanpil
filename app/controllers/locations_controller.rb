class LocationsController < ApplicationController
  def index
    if params[:search].present? && params[:location].present?
      @posts = Post.search_by_term(params[:search]).near(params[:location], 50)
    elsif params[:search].present? && !params[:location].present?
      @posts = Post.search_by_term(params[:search])
    elsif params[:search].present? && !params[:location].present?
      @posts = Post.near(params[:location], 50)
    elsif current_user && current_user.lat && current_user.long
      @posts = Post.near([current_user.lat, current_user.long], 50)
    else
      @posts = Post.last(20)
    end
  end
end
