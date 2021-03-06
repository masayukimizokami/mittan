class FamiliesController < ApplicationController
  before_action :set_family, only: %i[ show edit update destroy ]
  before_action :set_q

  # GET /families or /families.json
  def index
    @families1 = Family.order(point:"desc").limit(1)
    @families2 = Family.order(point:"desc").offset(1).limit(1)
    @families3 = Family.order(point:"desc").offset(2).limit(1)
    @families = Family.order(point:"desc").offset(3)
    @scores = Score.order(id:"desc").limit(2)
  end

  # GET /families/1 or /families/1.json
  def show
    @score = Score.new # 新規コメント投稿
    @scores = @family.scores.order(id: "DESC")
  end

  # GET /families/new
  def new
    @family = Family.new
  end

  # GET /families/1/edit
  def edit
    @scores = Score.order(id:"desc").limit(1)
  end

  # POST /families or /families.json
  def create
    @family = Family.new(family_params)

    respond_to do |format|
      if @family.save
        format.html { redirect_to family_url(@family), notice: "保存されました." }
        format.json { render :show, status: :created, location: @family }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /families/1 or /families/1.json
  def update
     @scores = Score.order(id:"desc").limit(1)
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to family_url(@family), notice: "保存されました." }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1 or /families/1.json
  def destroy
    @family.destroy

    respond_to do |format|
      format.html { redirect_to families_url, notice: "familyは削除されました." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def family_params
      params.require(:family).permit(:family_name, :image, :family_pr, :point)
    end

    def set_q
      @q = Cook.ransack(params[:q])
    end
end
