class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      redirect_to @location, :notice => "Sucessfully created location."
    else
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


end
