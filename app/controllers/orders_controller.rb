class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      # 注文が保存されたら、仕入れ先にメールを送信する
      OrderMailer.order_email(@order).deliver_now

      flash[:notice] = "注文が完了しました。"
      render :show
    else
      flash.now[:alert] = @order.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end

  def destroy
    @order.destroy
    flash[:notice] = "注文履歴の削除に成功しました。"
    redirect_to orders_path
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:ink_name, :order_quantity, :order_date, :user_id, :supplier_id)
    end
end
