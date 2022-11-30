class ToysController < ApplicationController
  # rescue_from  ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def show
    toy = Toy.find_by(id: params[:id])
    if toy
      render json: toy, status: :ok
    else
      render json: {error: "toy not found"},
      status: :not_found
    end
  end

  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :ok
  # rescue ActiveRecord::RecordInvalid => e
  #   render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
  end

  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)
    render json: toy
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  def increment_likes
    toy = toy.find_by(id: params[:id])
    if toy
      toy.update(likes: toy.likes + 1)
      render json: toy
    end
  end

  private

  # def render_unprocessable_entity(invalid)
  #   render json: {error: invalid.record.errors}, status: :unprocessable_entity
  # end
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
