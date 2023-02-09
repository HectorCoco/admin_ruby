class AddressesController < ApplicationController
  before_action :get_client
  before_action :set_address, only: %i[show edit update destroy]

  # GET /addresses or /addresses.json
  def index
    @addresses = @client.addresses
  end

  # GET /addresses/1 or /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = @client.addresses.build
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses or /addresses.json
  def create
    @address = @client.addresses.build(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to client_address_path(@client, @address), notice: "Adress was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to client_address_path(@client, @address), notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @address.destroy

    respond_to do |format|
      format.html { redirect_to client_path(@client), notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_client
    @client = Client.find(params[:client_id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_address
    @address = @client.addresses.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_params
    params.require(:address).permit(:street, :block, :lot, :colony, :postal_code, :city, :state, :client_id)
  end
end
