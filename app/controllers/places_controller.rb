class PlacesController < ApplicationController
  def index
    place = Place.all
    render json: place.as_json
  end

  def create
    place = Place.new({
      name: params[:name],
      address: params[:address]
    })
    if place.save
      render json: place.as_json
    else
      render json: { message: "Create failed!", errrors: place.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    place = Place.find(params[:id])
    render json: place.as_json
  end
  
  def update
    place = Place.find(params[:id])
    if place.update({
      name: params[:name] || place.name,
      address: params[:address] || place.address
    })
      render json: place.as_json
    else
      render json: { message: "Update failed!", errors: place.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    place = Place.find(params[:id])
    place.destroy
    render json: {message: "Place destroyed!" }
    
  end
end
