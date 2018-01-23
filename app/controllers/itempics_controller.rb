class ItempicsController < ApplicationController
  before_action :set_itempic, only: [:show, :update, :destroy]

  # GET /itempics
  def index
    @itempics = Itempic.all

    render json: @itempics
  end

  # GET /itempics/1
  def show
    render json: @itempic
  end

  # POST /itempics
  def create
    @itempic = Itempic.new(itempic_params)

    if @itempic.save
      render json: @itempic, status: :created, location: @itempic
    else
      render json: @itempic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /itempics/1
  def update
    if @itempic.update(itempic_params)
      render json: @itempic
    else
      render json: @itempic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /itempics/1
  def destroy
    @itempic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itempic
      @itempic = Itempic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def itempic_params
      params.fetch(:itempic, {})
    end
end
