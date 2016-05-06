class PoliticosController < ApplicationController
  before_action :set_politico, only: [:show, :edit, :update, :destroy]

  def home
    render :layout => 'landing'
  end

  # GET /politicos
  # GET /politicos.json
  def index
    @politicos = Politico.all
  end

  # GET /politicos/1
  # GET /politicos/1.json
  def show
  end

  # GET /politicos/new
  def new
    @politico = Politico.new
  end

  # GET /politicos/1/edit
  def edit
  end

  # POST /politicos
  # POST /politicos.json
  def create
    @politico = Politico.new(politico_params)

    respond_to do |format|
      if @politico.save
        format.html { redirect_to @politico, notice: 'Politico was successfully created.' }
        format.json { render :show, status: :created, location: @politico }
      else
        format.html { render :new }
        format.json { render json: @politico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /politicos/1
  # PATCH/PUT /politicos/1.json
  def update
    respond_to do |format|
      if @politico.update(politico_params)
        format.html { redirect_to @politico, notice: 'Politico was successfully updated.' }
        format.json { render :show, status: :ok, location: @politico }
      else
        format.html { render :edit }
        format.json { render json: @politico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /politicos/1
  # DELETE /politicos/1.json
  def destroy
    @politico.destroy
    respond_to do |format|
      format.html { redirect_to politicos_url, notice: 'Politico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politico
      @politico = Politico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def politico_params
      params.require(:politico).permit(:nome, :idade, :estado, :cidade, :municipio, :partido_id, :cargo_eleito, :cargo_atual, :status)
    end
end
