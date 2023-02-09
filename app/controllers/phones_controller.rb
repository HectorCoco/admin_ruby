class PhonesController < ApplicationController
  before_action :get_client
  before_action :set_phone, only: %i[show edit update destroy]
  # before_action :set_catalogs, only: %i[new edit create]

  # GET /phones or /phones.json
  def index
    @phones = @client.phones
  end

  # GET /phones/1 or /phones/1.json
  def show
  end

  # GET /phones/new
  def new
    @phone = @client.phones.build
  end

  # GET /phones/1/edit
  def edit
  end

  # POST /phones or /phones.json
  def create
    @phone = @client.phones.build(phone_params)

    respond_to do |format|
      if @phone.save
        format.html { redirect_to client_path(@client), notice: "Phone was successfully created." }
        format.json { render :show, status: :created, location: @phone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1 or /phones/1.json
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to client_path(@client), notice: "Phone was successfully updated." }
        format.json { render :show, status: :ok, location: @phone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1 or /phones/1.json
  def destroy
    @phone.destroy

    respond_to do |format|
      format.html { redirect_to client_phones_path(@client, @phone), notice: "Phone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_client
    @client = Client.find(params[:client_id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_phone
    @phone = @client.phones.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def phone_params
    params.require(:phone).permit(:number, :client_id)
  end
end
