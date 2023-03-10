class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy ]

  def index
    @suppliers = Supplier.all
  end

  def show
  end

  def new
    @supplier = Supplier.new
  end

  def edit
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      flash[:notice] = "仕入れ先の登録に成功しました。"
      render :show
    else
      flash.now[:alert] = @supplier.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end

  def update
    if @supplier.update(supplier_params)
      flash[:notice] = "仕入れ先の更新に成功しました。"
      redirect_to supplier_path(@supplier)
    else
      flash.now[:alert] = @supplier.errors.full_messages.join("<br>").html_safe
      render :edit
    end
  end

  def destroy
    @supplier.destroy
    flash[:notice] = "仕入れ先の削除に成功しました。"
    redirect_to suppliers_path
  end

  private
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:name, :email)
    end
end
