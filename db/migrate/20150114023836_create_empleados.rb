class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.date :fecha_nacimiento
      t.string :area
      t.string :puesto
      t.string :sexo
      t.decimal :salario

      t.timestamps
    end
  end
end
