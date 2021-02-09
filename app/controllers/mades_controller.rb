class MadesController < ApplicationController
  before_action :set_made, only: [:show, :edit, :update, :destroy]

  # GET /mades
  # GET /mades.json
  def index
    @mades = Made.all
  end

  # GET /mades/1
  # GET /mades/1.json
  def show
  end

  # GET /mades/new
  def new
    @made = Made.new
  end

  # GET /mades/1/edit
  def edit
  end

  # POST /mades
  # POST /mades.json
  def create
    @made = Made.new(made_params)
    @made.image.attach(params[:made][:image])

    respond_to do |format|
      if @made.save
        format.html { redirect_to @made, notice: 'Made was successfully created.' }
        format.json { render :show, status: :created, location: @made }
      else
        format.html { render :new }
        format.json { render json: @made.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mades/1
  # PATCH/PUT /mades/1.json
  def update
    respond_to do |format|
      if @made.update(made_params)
        format.html { redirect_to @made, notice: 'Made was successfully updated.' }
        format.json { render :show, status: :ok, location: @made }
      else
        format.html { render :edit }
        format.json { render json: @made.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mades/1
  # DELETE /mades/1.json
  def destroy
    @made.destroy
    respond_to do |format|
      format.html { redirect_to mades_url, notice: 'Made was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_made
      @made = Made.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def made_params
      params.require(:made).permit(:content, :user_id)
    end
end
