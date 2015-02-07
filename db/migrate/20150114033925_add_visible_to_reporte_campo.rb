class AddVisibleToReporteCampo < ActiveRecord::Migration
  def change
    add_column :reporte_campos, :visible, :boolean
  end
end
