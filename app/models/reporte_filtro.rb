# == Schema Information
#
# Table name: reporte_filtros
#
#  id            :integer          not null, primary key
#  reporte_id    :integer
#  etiqueta      :string(255)
#  parametro     :string(255)
#  valor_inicial :string(255)
#  tipo          :string(255)
#  elementos     :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class ReporteFiltro < ActiveRecord::Base
	 validates_presence_of :reporte_id, :etiqueta, :parametro

	 belongs_to :reporte
end
