# == Schema Information
#
# Table name: empleados
#
#  id               :integer          not null, primary key
#  nombre           :string(255)
#  fecha_nacimiento :date
#  area             :string(255)
#  puesto           :string(255)
#  sexo             :string(255)
#  salario          :decimal(, )
#  created_at       :datetime
#  updated_at       :datetime
#

class Empleado < ActiveRecord::Base
end
