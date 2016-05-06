class AcontecimentosController < ApplicationController
  before_action :set_acontecimento, only: [:show, :edit, :update, :destroy]

  # GET /acontecimentos
  # GET /acontecimentos.json
  def index
    @acontecimentos = Acontecimento.all
  end

  # GET /acontecimentos/1
  # GET /acontecimentos/1.json
  def show
  end

  # GET /acontecimentos/new
  def new
    @acontecimento = Acontecimento.new
  end

  # GET /acontecimentos/1/edit
  def edit
  end

  # POST /acontecimentos
  # POST /acontecimentos.json
  def create
    @acontecimento = Acontecimento.new(acontecimento_params)

    respond_to do |format|
      if @acontecimento.save
        format.html { redirect_to @acontecimento, notice: 'Acontecimento was successfully created.' }
        format.json { render :show, status: :created, location: @acontecimento }
      else
        format.html { render :new }
        format.json { render json: @acontecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acontecimentos/1
  # PATCH/PUT /acontecimentos/1.json
  def update
    respond_to do |format|
      if @acontecimento.update(acontecimento_params)
        format.html { redirect_to @acontecimento, notice: 'Acontecimento was successfully updated.' }
        format.json { render :show, status: :ok, location: @acontecimento }
      else
        format.html { render :edit }
        format.json { render json: @acontecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acontecimentos/1
  # DELETE /acontecimentos/1.json
  def destroy
    @acontecimento.destroy
    respond_to do |format|
      format.html { redirect_to acontecimentos_url, notice: 'Acontecimento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acontecimento
      @acontecimento = Acontecimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acontecimento_params
      params.require(:acontecimento).permit(:titulo, :descricao, :link)
    end
end
