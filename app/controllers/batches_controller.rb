class BatchesController < ApplicationController
  before_action :set_batch, only: %i[show edit update destroy]

  # GET /batches or /batches.json
  def index
    @pagy, @batches = pagy(Batch.all.order_by_free.order_by_block.order_by_lot)
  end

  # GET /batches/1 or /batches/1.json
  def show
  end

  # GET /batches/new
  def new
    @batch = Batch.new
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches or /batches.json
  def create
    @batch = Batch.new(batch_params)

    respond_to do |format|
      if @batch.save
        format.html { redirect_to batch_url(@batch), notice: "El lote fue creado exitosamente." }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1 or /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to batch_url(@batch), notice: "El lote fue actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1 or /batches/1.json
  def destroy
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to batches_url, notice: "El lote fue eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_batch
    @batch = Batch.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def batch_params
    params.require(:batch).permit(:uuid, :price, :lot, :block, :boundaries, :state, :description, :square_meters)
  end
end
