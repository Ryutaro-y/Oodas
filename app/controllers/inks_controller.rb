class InksController < ApplicationController
  before_action :set_ink, only: %i[ show edit update destroy ]

  # GET /inks or /inks.json
  def index
    @inks = Ink.all
  end

  # GET /inks/1 or /inks/1.json
  def show
    @ink = Ink.find(params[:id])
  end

  # GET /inks/new
  def new
    @ink = Ink.new
  end

  # GET /inks/1/edit
  def edit
  end

  # POST /inks or /inks.json
  def create
    @ink = Ink.new(ink_params)

    respond_to do |format|
      if @ink.save
        format.html { redirect_to ink_url(@ink), notice: "インクの登録に成功しました。" }
        format.json { render :show, status: :created, location: @ink }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inks/1 or /inks/1.json
  def update
    respond_to do |format|
      if @ink.update(ink_params)
        format.html { redirect_to ink_url(@ink), notice: "インクの更新に成功しました。" }
        format.json { render :show, status: :ok, location: @ink }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inks/1 or /inks/1.json
  def destroy
    @ink.destroy

    respond_to do |format|
      format.html { redirect_to inks_url, notice: "インクの削除に成功しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ink
      @ink = Ink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ink_params
      params.require(:ink).permit(:name, :color_type)
    end
end
