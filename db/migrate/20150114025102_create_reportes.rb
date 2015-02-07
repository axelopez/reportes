class CreateReportes < ActiveRecord::Migration
  def change
    create_table :reportes do |t|
      t.string :titulo
      t.string :area
      t.text :descripcion
      t.text :sql
      t.boolean :activo

      t.timestamps
    end
  end
end
