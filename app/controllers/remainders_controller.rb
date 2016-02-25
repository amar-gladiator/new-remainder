class RemaindersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_remainder, only: [:show, :edit, :update, :destroy, :new, :create]

  # GET /remainders
  # GET /remainders.json
  def index
    @remainders = Remainder.all
  end

  # GET /remainders/1
  # GET /remainders/1.json
  def show
    @remainder =  @group.remainders
  end

  # GET /remainders/new
  def new
    @remainder = @group.remainders.new
  end

  # GET /remainders/1/edit
  def edit
  end

  # POST /remainders
  # POST /remainders.json
  def create
    @remainder = @group.remainders.new(remainder_params)
    respond_to do |format|
      if @remainder.save
        format.html { redirect_to group_remainders_path(@group), notice: 'Remainder was successfully created.' }
        format.json { render :show, status: :created, location: @remainder }
      else
        format.html { render :new }
        format.json { render json: @remainder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remainders/1
  # PATCH/PUT /remainders/1.json
  def update
    respond_to do |format|
      if @remainder.update(remainder_params)
        format.html { redirect_to @remainder, notice: 'Remainder was successfully updated.' }
        format.json { render :show, status: :ok, location: @remainder }
      else
        format.html { render :edit }
        format.json { render json: @remainder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remainders/1
  # DELETE /remainders/1.json
  def destroy
    @remainder.destroy
    respond_to do |format|
      format.html { redirect_to remainders_url, notice: 'Remainder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remainder
      @group = Group.find_by(params[:id])
      # @remainder = Remainder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remainder_params
      params.require(:remainder).permit(:name, :start_date, :end_date, :remainder_time, :schedule_interval, :message, :group_id, :status)
    end
end
