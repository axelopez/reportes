class ReportesController < ApplicationController
  before_action :set_reporte, only: [:show, :edit, :update, :destroy,:print]

  respond_to :html

  def index
    @reportes = Reporte.all
    respond_with(@reportes)
  end

  def print
      @parametros =  Hash.new(0)
      @parametros_descriptivo=""
      @reporte.reporte_filtros.each do |filtro|
        @parametros[filtro.parametro]= params["parametro_"+filtro.parametro]||=filtro.valor_inicial

        if (params["parametro_"+filtro.parametro]||=filtro.valor_inicial).to_s.length>0
          @parametros_descriptivo+= "#{filtro.etiqueta}: #{@parametros[filtro.parametro]} "
        end
      end
      test=@reporte.data(@parametros)
      if test.class== String
         @error= test
         render :error
      end
  end

  def show
    respond_with(@reporte)
  end

  def new
    @reporte = Reporte.new
    respond_with(@reporte)
  end

  def edit
  end

  def create
    @reporte = Reporte.new(reporte_params)
    @reporte.save
    respond_with(@reporte)
  end

  def update
    @reporte.update(reporte_params)
    respond_with(@reporte)
  end

  def destroy
    @reporte.destroy
    respond_with(@reporte)
  end

  private
    def set_reporte
      @reporte = Reporte.find(params[:id])
    end

    def reporte_params
      params.require(:reporte).permit(:titulo, :area, :descripcion, :sql, :activo)
    end
end
