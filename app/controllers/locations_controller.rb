class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(loc_params)
    if @location.save
      redirect_to @location, :notice => "Sucessfully created location."
    else
      puts @location.errors.messages
      render :action => 'new'
    end
  end

  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 10, :order => :distance)
    else
      @locations = Location.all
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  private

  def loc_params
    params.require(:location).permit(:address)

  end


end
