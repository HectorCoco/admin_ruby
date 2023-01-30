class ContractsController < ApplicationController
  before_action :set_contract, only: %i[show edit update destroy]
  before_action :set_catalogs

  # GET /contracts or /contracts.json
  def index
    @contracts = Contract.eager_load(:batches, :payments).all
  end

  # GET /contracts/1 or /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts or /contracts.json
  def create
    @contract = Contract.new(contract_params)
    set_batches_selected
    # get_all_batches

    respond_to do |format|
      if @contract.save
        @contract.set_first_next_payment
        @contract.update_contract_in_batch

        format.html { redirect_to contract_url(@contract), notice: "Contract was successfully created." }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1 or /contracts/1.json
  def update
    respond_to do |format|
      set_batches_selected
      # get_all_batches

      if @contract.update(contract_params)
        @contract.update_contract_in_batch

        format.html { redirect_to contract_url(@contract), notice: "Contract was successfully updated." }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1 or /contracts/1.json
  def destroy
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to contracts_url, notice: "Contract was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contract
    @contract = Contract.find(params[:id])
  end

  def set_catalogs
    @batches = batches_allowed
    @clients = Client.active.all.order_by_name
  end

  def batches_allowed
    # binding.pry
    return Batch.allowed if @contract.nil?

    Batch.allowed + @contract.batches
    # @batches = Batch.allowed
    # @batches + @contract.batches unless @contract.nil?
  end

  def set_batches_selected
    @contract.batches_selected = params[:contract][:batch_id].reject(&:empty?).map(&:to_i)
  end

  # def get_all_batches
  #   @contract.batch_list = Batch.all
  # end

  # Only allow a list of trusted parameters through.
  def contract_params
    params.require(:contract).permit(:total_amount, :total_payments, :comments, :client_id, :down_payment, :next_payment, :first_payment, :monthly_payment, :map, :map_date)
  end
end
