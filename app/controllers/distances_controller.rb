class DistancesController < ApplicationController
  def new
    @places = Place.all
  end

  def create
    @from = Place.find_by(id: params[:from])
    @to = Place.find_by(id: params[:to])
    if @from && @to
      flash[:success] =
          "The distance between <b>#{@from.name}</b> and <b>#{@to.name}</b> is #{@from.distance_from(@to.to_coordinates)} mi"
    end
    redirect_to new_distance_path
  end
end