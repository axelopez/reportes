class CreateReporteFiltros < ActiveRecord::Migration
  def change
    create_table :reporte_filtros do |t|
      t.integer :reporte_id
      t.string :etiqueta
      t.string :parametro
      t.string :valor_inicial
      t.string :tipo
      t.string :elementos

      t.timestamps
    end
  end
end
