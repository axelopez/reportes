class ReporteCamposController < ApplicationController
  before_action :set_reporte_campo, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reporte_campos = ReporteCampo.all
    respond_with(@reporte_campos)
  end

  def show
    respond_with(@reporte_campo)
  end

  def new
    @reporte_campo = ReporteCampo.new
    @reporte_campo.reporte_id= params[:reporte_id]
    
    respond_with(@reporte_campo)
  end

  def edit
  end

  def create
    @reporte_campo = ReporteCampo.new(reporte_campo_params)
    @reporte_campo.save
    respond_with(@reporte_campo, :location => reporte_path(@reporte_campo.reporte_id))
  end

  def update
    @reporte_campo.update(reporte_campo_params)
    respond_with(@reporte_campo, :location => reporte_path(@reporte_campo.reporte_id))
  end

  def destroy
    @reporte_campo.destroy
    respond_with(@reporte_campo)
  end

  private
    def set_reporte_campo
      @reporte_campo = ReporteCampo.find(params[:id])
    end

    def reporte_campo_params
      params.require(:reporte_campo).permit(:reporte_id, :campo, :descripcion, :tipo, :orden, :visible,:sumatoria)
    end
end
