class SitesController < ApplicationController
  before_action :set_site, only: %i[ show update destroy ]
  before_action :set_sites, only: %i[ index ]

  # GET /sites
  def index
    render json: @sites
  end

  # GET /sites/1
  def show
    render json: @site
  end

  # POST /sites
  def create
    @site = Site.new(site_params)

    if @site.save
      render json: @site, status: :created, location: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sites/1
  def update
    if @site.update(site_params)
      render json: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sites/1
  def destroy
    @site.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = current_user.sites.find(params[:id])
    end

    def set_sites
      @sites = current_user.sites.where(portfolio_id: params["portfolio_id"])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      params.require(:site).permit(:portfolio_id)
    end
end
