class InksController < ApplicationController
  before_action :set_ink, only: %i[ show edit update destroy ]

  def index
    @inks = Ink.all
  end

  def show
  end

  def new
    @ink = Ink.new
  end

  def edit
  end

  def create
    @ink = Ink.new(ink_params)
  
    if @ink.save
      flash[:notice] = "インクの登録に成功しました。"
      render :show
    else
      flash.now[:alert] = @ink.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end

  def update
    if @ink.update(ink_params)
      flash[:notice] = "インクの更新に成功しました。"
      redirect_to ink_path(@ink)
    else
      flash.now[:alert] = @ink.errors.full_messages.join("<br>").html_safe
      render :edit
    end
  end

  def destroy
    @ink.destroy
    flash[:notice] = "インクの削除に成功しました。"
    redirect_to inks_path
  end

  private
    def set_ink
      @ink = Ink.find(params[:id])
    end

    def ink_params
      params.require(:ink).permit(:name, :color_type)
    end
end
