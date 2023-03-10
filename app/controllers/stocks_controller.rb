class StocksController < ApplicationController
  before_action :set_stock, only: %i[ show edit update destroy ]

  def index
    @stocks = Stock.all
  end

  def show
  end

  def new
    @stock = Stock.new
  end

  def edit
  end

  def create
    @stock = Stock.new(stock_params)

    if @stock.save
      flash[:notice] = "在庫の登録に成功しました。"
      render :show
    else
      flash.now[:alert] = @stock.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end

  def update
    if @stock.update(stock_params)
      flash[:notice] = "在庫の更新に成功しました。"
      redirect_to stock_path(@stock)
    else
      flash.now[:alert] = @stock.errors.full_messages.join("<br>").html_safe
      render :edit
    end
  end

  def destroy
    @stock.destroy
    flash[:notice] = "在庫の削除に成功しました。"
    redirect_to stocks_path
  end

  private
    def set_stock
      @stock = Stock.find(params[:id])
    end

    def stock_params
      params.require(:stock).permit(:ink_name, :color_type, :location_name, :stage, :quantity, :user_id)
    end
end
