class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy ]

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      flash[:notice] = "ロケーションの登録に成功しました。"
      render :show
    else
      flash.now[:alert] = @location.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end

  def update
    if @location.update(location_params)
      flash[:notice] = "ロケーションの更新に成功しました。"
      redirect_to location_path(@location)
    else
      flash.now[:alert] = @location.errors.full_messages.join("<br>").html_safe
      render :edit
    end
  end

  def destroy
    @location.destroy
    flash[:notice] = "ロケーションの削除に成功しました。"
    redirect_to locations_path
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :stage, :ink_name)
    end
end
