class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /items
  def index
    @items = Item.all

    render json: @items
  end

  # GET /items/1
  def show
    @response = @item.as_json(:methods => [:user], :include => [:messages])
    render json: @response
  end

  # POST /new
  def create
    @item = Item.new(:name => params[:name], :detail => params[:detail], :original_price => params[:original_price], 
    :second_price => params[:second_price], :wear_level => params[:wear_level], :tag => params[:tag], 
    :state => params[:state], :user_id => params[:user_id], :picture => params[:picture])

    if @item.save
      render json: "success"
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(:name => params[:name], :detail => params[:detail], :original_price => params[:original_price], 
      :second_price => params[:second_price], :wear_level => params[:wear_level], :tag => params[:tag], 
      :state => params[:state], :user_id => params[:user_id], :picture => params[:picture])
      render json: "success"
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  # GET /search
  def search
    @item = Item.where("name LIKE '%#{params[:item_name]}%'")
    @response = @item.as_json(include: :user)
    render json: @response
  end
  
  def upload_pic
    @item = Item.find_by(id:params[:id])
    @item.picture = params[:picture]
    if @item.save
      render json: "upload picture success"
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end
  
  # GET /picture
  def picture
    picture = params[:picture_name]
    send_file "#{Rails.root}/public#{picture}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.fetch(:item, {})
    end
end
