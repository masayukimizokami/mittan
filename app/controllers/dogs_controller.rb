class DogsController < ApplicationController
  layout 'dogs'
  before_action :set_dog, only: %i[ show edit update destroy ]

  # GET /dogs or /dogs.json
  def index
    @dogs = Dog.all
    @nakanokus = Pen.all
    @simonokus = Pig.all
    @randamdog = @dogs.order("RANDOM()").limit(1)
    @randamdog2 = @nakanokus.order("RANDOM()").limit(1)
    @randamdog3 = @simonokus.order("RANDOM()").limit(1)
    @time = Time.now.strftime('%H')
    @date = Time.now.strftime('%d')
    @min = Time.now.strftime('%M')
  end

  # GET /dogs/1 or /dogs/1.json
  def show
  end

  def food
  end

  def walk
  end

  def snack
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs or /dogs.json
  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        format.html { redirect_to new_pig_path, notice: "Dog was successfully created." }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1 or /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to dog_url(@dog), notice: "Dog was successfully updated." }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1 or /dogs/1.json
  def destroy
    @dog.destroy

    respond_to do |format|
      format.html { redirect_to dogs_url, notice: "Dog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dog_params
      params.require(:dog).permit(:name, :onaka, :kigen, :image, :pr, :yobip, :kaminoku, :nakanoku, :simonoku)
    end
end
