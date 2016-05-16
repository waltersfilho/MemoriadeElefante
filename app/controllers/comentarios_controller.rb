class ComentariosController < ApplicationController
  before_action :set_politico, only: [:create]
  before_action :set_comentario, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!
  before_filter :require_permission, only: [:destroy]

  # GET /comentarios
  # GET /comentarios.json
  def index
    @comentarios = Comentario.order("created_at asc")
  end

  def upvote
    @comentario.upvote_by current_user
    redirect_to :back
  end
  def downvote
    @comentario.downvote_by current_user
    redirect_to :back
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
  end

  # GET /comentarios/new
  def new
    @comentario = Comentario.new
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = @politico.comentarios.build(comentario_params)
    @comentario.user_id = current_user.id
    @comentario.save
    redirect_to @politico
  end

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to @comentario, notice: 'Comentario was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    #Encontrando um comentário dentro do post.
    @comentario = @politico.comentarios.find(params[:id])
    @comentario.destroy
    redirect_to @politico
  end

  private
    # Use callbacks to share common setup or constraints between actions.
     def require_permission
      set_comentario
      @comentario = @politico.comentarios.find(params[:id])
      if (current_user != @politico.user) and (current_user != @comentario.user)
        flash[:notice] = 'Permissões insuficientes!'
        redirect_to @politico
      end
     end

    def set_politico
      @politico = Politico.find(params[:politico_id])
    end
    def set_comentario
      set_politico
      #@politico = Politico.find(params[:politico_id])
      @comentario = @politico.comentarios.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.require(:comentario).permit(:mensagem)
    end
end
