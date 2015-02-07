class CreateReporteCampos < ActiveRecord::Migration
  def change
    create_table :reporte_campos do |t|
      t.integer :reporte_id
      t.string :campo
      t.string :descripcion
      t.string :tipo

      t.timestamps
    end
  end
end
