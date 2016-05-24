class PoliticosController < ApplicationController
  before_action :set_politico, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  #Garantindo que somente o dono de um Post pode executar as ações de edit, update e destroy
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def home
    render :layout => 'landing'
  end

  def mapa
    render "mapa"
  end

  
  def upvote
    @politico.upvote_by current_user
    redirect_to :back
  end
  def downvote
    @politico.downvote_from current_user
    redirect_to :back
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
    @politico = current_user.politicos.build
  end

  # GET /politicos/1/edit
  def edit
  end

  # POST /politicos
  # POST /politicos.json
  def create
    @politico = current_user.politicos.build(politico_params)

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
    def require_permission
      if current_user != Politico.find(params[:id]).user
        flash[:notice] = 'Permissões insuficientes!'
        redirect_to root_path
      end
    end
    def set_politico
      if (params[:cargo_atual] && params[:estado])  
          @politico = Politico.where(:cargo_eleito=>params[:cargo_atual]).where(:estado=>params[:estado]).first
        else
        if (params[:cargo_atual])
          @politico = Politico.where(cargo_atual: params[:cargo_atual]).first
        else
          @politico = Politico.find(params[:id])
        end
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def politico_params
      params.require(:politico).permit(:nome, :idade, :estado, :cidade, :municipio, :partido_id, :cargo_eleito, :cargo_atual, :status, :photo, :user_id)
    end
end
