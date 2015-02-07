class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @empleados = Empleado.all
    respond_with(@empleados)
  end

  def show
    respond_with(@empleado)
  end

  def new
    @empleado = Empleado.new
    respond_with(@empleado)
  end

  def edit
  end

  def create
    @empleado = Empleado.new(empleado_params)
    flash[:notice] = 'Empleado was successfully created.' if @empleado.save
    respond_with(@empleado)
  end

  def update
    flash[:notice] = 'Empleado was successfully updated.' if @empleado.update(empleado_params)
    respond_with(@empleado)
  end

  def destroy
    @empleado.destroy
    respond_with(@empleado)
  end

  private
    def set_empleado
      @empleado = Empleado.find(params[:id])
    end

    def empleado_params
      params.require(:empleado).permit(:nombre, :fecha_nacimiento, :area, :puesto, :sexo, :salario)
    end
end
