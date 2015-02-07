class AddSumatoriaToReporteCampo < ActiveRecord::Migration
  def change
    add_column :reporte_campos, :sumatoria, :string
  end
end
