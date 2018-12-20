class VendasController < ApplicationController
  before_action :set_venda, only: %i[show]

  # GET /vendas
  # GET /vendas.json
  def index
    @vendas = Venda.all
  end

  # GET /vendas/1
  # GET /vendas/1.json
  def show; end

  # GET /vendas/new
  def new
    @venda = Venda.new
  end

  # POST /vendas
  # POST /vendas.json
  def create
    @venda = Venda.new(venda_params)

    respond_to do |format|
      if @venda.save
        format.html { redirect_to @venda, notice: 'Venda was successfully created.' }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_venda
    @venda = Venda.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def venda_params
    params.require(:venda).permit(:produto_id, :material_id, :valorVenda, :valorInstalacao, :cliente_id)
  end
end
