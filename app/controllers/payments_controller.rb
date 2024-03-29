class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]
  before_action :set_catalogs, only: %i[new show update edit create destroy]

  # GET /payments or /payments.json
  def index
    @pagy, @payments = pagy(Payment.all.order_by_realization_date.order_by_date.order_by_file_number_desc)
  end

  # GET /payments/1 or /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    @payment.contract_id = params[:contract_id]
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to contract_path(@payment.contract), notice: "El pago fue registrado exitosamente." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payment_url(@payment), notice: "El pago fue actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to contract_path(@payment.contract), notice: "El pago fue eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  def set_catalogs
    @contracts = Contract.all
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:date, :file_number, :kind, :amount, :comments, :contract_id, :realization_date)
  end
end
