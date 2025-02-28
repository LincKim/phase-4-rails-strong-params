class BirdsController < ApplicationController

  wrap_parameters format: []  # disables the wrap parameters for individual controller 

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private   # It is recommended that strong params be put in a private method for of reusabilty

  def bird_params   # strong params in use
    params.permit(:name, :species)
  end

end
