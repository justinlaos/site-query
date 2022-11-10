class SpacesController < ApplicationController
  before_action :set_space, only: %i[ show update destroy ]
  before_action :set_spaces, only: %i[ index ]

  # GET /spaces
  def index
    render json: @spaces
  end

  # GET /spaces/1
  def show
    render json: @space
  end

  # POST /spaces
  def create
    @space = Space.new(space_params)

    if @space.save
      render json: @space, status: :created, location: @space
    else
      render json: @space.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spaces/1
  def update
    if @space.update(space_params)
      render json: @space
    else
      render json: @space.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spaces/1
  def destroy
    @space.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = current_user.spaces.find(params[:id])
    end

    def set_spaces
      @spaces = current_user.spaces.where(site_id: params["site_id"])
    end

    # Only allow a list of trusted parameters through.
    def space_params
      params.require(:space).permit(:site_id)
    end
end
