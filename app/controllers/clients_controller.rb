class ClientsController < ApplicationController
  before_action :set_client, :set_catalogs, only: %i[show edit update destroy]
  # before_action :set_catalogs, only: %i[new edit create]

  # GET /clients or /clients.json
  def index
    @pagy, @clients = pagy(Client.all.order_by_active.order_by_name)
  end

  # GET /clients/1 or /clients/1.json
  def show
    @contracts = @client.contracts.order_by_date
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to client_url(@client), notice: "El cliente fue creado exitosamente." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "El cliente fue actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "El cliente fue eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  def results
    @value = params[:value].downcase
    @error = false
    if @value.empty? || @value.length < 3 || @value.nil?
      @error = true
    else
      @results = Client.search(Client::SEARCH_COLUMNS, @value)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.eager_load(:phones, :addresses).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_params
    params.require(:client).permit(:first_name, :middle_name, :last_name, :status, :email)
  end
end

def set_catalogs
end
