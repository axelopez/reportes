class ReporteFiltrosController < ApplicationController
  before_action :set_reporte_filtro, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reporte_filtros = ReporteFiltro.all
    respond_with(@reporte_filtros)
  end

  def show
    respond_with(@reporte_filtro)
  end

  def new
    @reporte_filtro = ReporteFiltro.new
    @reporte_filtro.reporte_id= params[:reporte_id]
    respond_with(@reporte_filtro)
  end

  def edit
  end

  def create
    @reporte_filtro = ReporteFiltro.new(reporte_filtro_params)
    @reporte_filtro.save
    respond_with(@reporte_filtro, :location => reporte_path(@reporte_filtro.reporte_id))
  end

  def update
    @reporte_filtro.update(reporte_filtro_params)
    respond_with(@reporte_filtro, :location => reporte_path(@reporte_filtro.reporte_id))
  end

  def destroy
    @reporte_filtro.destroy
    respond_with(@reporte_filtro)
  end

  private
    def set_reporte_filtro
      @reporte_filtro = ReporteFiltro.find(params[:id])
    end

    def reporte_filtro_params
      params.require(:reporte_filtro).permit(:reporte_id, :etiqueta, :parametro, :valor_inicial, :tipo, :elementos)
    end
end
