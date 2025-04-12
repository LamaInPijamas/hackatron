class MicrogridConfigsController < ApplicationController
  before_action :set_microgrid_config, only: %i[ show edit update destroy ]

  # GET /microgrid_configs or /microgrid_configs.json
  def index
    @microgrid_configs = MicrogridConfig.all
  end

  # GET /microgrid_configs/1 or /microgrid_configs/1.json
  def show
  end

  # GET /microgrid_configs/new
  def new
    @microgrid_config = MicrogridConfig.new
  end

  # GET /microgrid_configs/1/edit
  def edit
  end

  # POST /microgrid_configs or /microgrid_configs.json
  def create
    @microgrid_config = MicrogridConfig.new(microgrid_config_params)

    respond_to do |format|
      if @microgrid_config.save
        format.html { redirect_to @microgrid_config, notice: "Microgrid config was successfully created." }
        format.json { render :show, status: :created, location: @microgrid_config }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @microgrid_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microgrid_configs/1 or /microgrid_configs/1.json
  def update
    respond_to do |format|
      if @microgrid_config.update(microgrid_config_params)
        format.html { redirect_to @microgrid_config, notice: "Microgrid config was successfully updated." }
        format.json { render :show, status: :ok, location: @microgrid_config }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @microgrid_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microgrid_configs/1 or /microgrid_configs/1.json
  def destroy
    @microgrid_config.destroy!

    respond_to do |format|
      format.html { redirect_to microgrid_configs_path, status: :see_other, notice: "Microgrid config was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_microgrid_config
      @microgrid_config = MicrogridConfig.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def microgrid_config_params
      params.expect(microgrid_config: [ :load_flexibility, :battery_capacity, :ev_charging_power ])
    end
end
