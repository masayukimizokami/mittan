class CooksController < ApplicationController

  before_action :set_q
  # GET /cooks or /cooks.json

  def top 
    @cooks = Cook.all
    @random = @cooks.order("RANDOM()").limit(3)
    @families = Family.all
    @rnd = @families.order("RANDOM()").limit(1)
    @dogruns = Dogrun.all
    @rnddg = @dogruns.order("RANDOM()").limit(1)
  end
  
  def index
    @cooks = Cook.order(id:"desc").last(20)
  end

  def search
    @results = @q.result
    @path = request.fullpath
    @url = request.url
  end

  # GET /cooks/1 or /cooks/1.json
  def show
    @cook = Cook.find(params[:id])
  end

  # GET /cooks/new
  def new
    @cook = Cook.new
  end

  # GET /cooks/1/edit
  def edit
    @cook = Cook.find(params[:id])
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
    @cook = Cook.find(params[:id])
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
    @cook = Cook.find(params[:id])
    @cook.destroy

    respond_to do |format|
      format.html { redirect_to cooks_url, notice: "メニューが削除されました." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def cook_params
      params.require(:cook).permit(:cookname, :cookurl, :image, :pr, :cost, :recom, :date, :point, :standby, :cookingday)
    end

    def set_q
      @q = Cook.ransack(params[:q])
    end
end
