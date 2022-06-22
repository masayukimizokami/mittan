class CooksController < ApplicationController
  before_action :set_cook, only: %i[ show edit update destroy]
  before_action :set_q
  # GET /cooks or /cooks.json

  def top 
    @cooks = Cook.all
    @random = @cooks.order("RANDOM()").limit(3)
  end
  
  def index
    @cooks = Cook.all
  end

  def search
    @results = @q.result
  end

  # GET /cooks/1 or /cooks/1.json
  def show
  end

  # GET /cooks/new
  def new
    @cook = Cook.new
  end

  # GET /cooks/1/edit
  def edit
  end

  # POST /cooks or /cooks.json
  def create
    @cook = Cook.new(cook_params)

    respond_to do |format|
      if @cook.save
        format.html { redirect_to cook_url(@cook), notice: "メニューが保存されました." }
        format.json { render :show, status: :created, location: @cook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cooks/1 or /cooks/1.json
  def update
    respond_to do |format|
      if @cook.update(cook_params)
        format.html { redirect_to cook_url(@cook), notice: "メニューが更新されました." }
        format.json { render :show, status: :ok, location: @cook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cooks/1 or /cooks/1.json
  def destroy
    @cook.destroy

    respond_to do |format|
      format.html { redirect_to cooks_url, notice: "メニューが削除されました." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cook
      @cook = Cook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cook_params
      params.require(:cook).permit(:cookname, :cookurl, :image, :pr, :cost, :recom, :date, :point, :standby, :cookingday)
    end

    def set_q
      @q = Cook.ransack(params[:q])
    end
end
