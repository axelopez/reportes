class AddOrdenToReporteCampo < ActiveRecord::Migration
  def change
    add_column :reporte_campos, :orden, :integer
  end
end
