class LocationsController < ApplicationController
  def index
    if params[:location].present?
      @profiles = Profile.near(params[:location], 50)
    elsif current_user && current_user.lat && current_user.long
      @profiles = Profile.near([current_user.lat, current_user.long], 50)
    else
      @profiles = Profile.last(20)
    end
  end
end
