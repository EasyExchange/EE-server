class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create_or_get_user
    @user = User.find_by(name:params[:name])
    if (@user == nil)
      @user = User.new(:name => params[:name], :profile => params[:profile])
      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: @user
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # GET /me
  def me
    @user = User.find(params[:user_id])
    render json: @user
  end

  # GET /me/posted
  def me_posted
    @user = User.find(params[:user_id])
    @items = Item.where("user_id = ?", @user.id)
    render json: @items
  end

  # GET /me/message
  def me_message
    @user = User.find(params[:user_id])
    @messages = Message.where("receiver_id = ?", @user.id)
    render json: @messages
  end

  # PATCH/PUT /me/update
  def me_update
    @user = User.find(params[:id])
    if @user.update_attributes(:name => params[:name], :profile => params[:profile], 
      :tel => params[:tel], :address => params[:address])
      render json: "success"
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.fetch(:user, {})
    end
end
