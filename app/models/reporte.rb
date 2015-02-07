# == Schema Information
#
# Table name: reportes
#
#  id          :integer          not null, primary key
#  titulo      :string(255)
#  area        :string(255)
#  descripcion :text
#  sql         :text
#  activo      :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Reporte < ActiveRecord::Base
	 has_many :reporte_campos
	 has_many :reporte_filtros

	 validates_presence_of :titulo, :descripcion, :sql
	 
	 def data(parametros)

	 	sql=self.sql
	 	errores=0
	 	detalle_parametros=""
	 	self.reporte_filtros.each do |filtro|
	 		
	 		detalle_parametros+= "<b>Parametro:</b> #{filtro.etiqueta} <b>Valor:</b> #{parametros[filtro.parametro]||="vacio"} <br>"
	 		if !parametros[filtro.parametro] || parametros[filtro.parametro].to_s.length == 0 
	 			if filtro.tipo=="Decimal"
	 				errores=errores+1
	 			end
	 		end

	 		sql=sql.gsub("<#{filtro.parametro}>", parametros[filtro.parametro])
	 		
	 	end

	 	if errores==0
	 		ActiveRecord::Base.connection.execute(sql)	 	
	 	else
	 		#"No se han enviado todos los parametros o el tipo de dato no es correcto. <br><br> <b>Parametros</b> <br><br> #{detalle_parametros}"
	 		
			"No se han enviado todos los parametros o el tipo de dato no es correcto. "

	 	end
	 rescue  Exception => e
         "Error! #{e}"
	 end
end
