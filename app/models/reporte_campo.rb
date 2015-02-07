# == Schema Information
#
# Table name: reporte_campos
#
#  id          :integer          not null, primary key
#  reporte_id  :integer
#  campo       :string(255)
#  descripcion :string(255)
#  tipo        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  orden       :integer
#  visible     :boolean
#  sumatoria   :string(255)
#

#Tipos: Date, Datetime, String, Decimal
class ReporteCampo < ActiveRecord::Base
	default_scope { order('orden') } 
	belongs_to :reporte

	def tipo_datatable
		tipo="html"

		if self.tipo == "Date"
			tipo="date-eu"
		end

		if self.tipo == "DateTime"
			tipo="date-euro"
		end

		if self.tipo== "Decimal"
			tipo="numeric-comma"
		end

		tipo
	end

	def visible_datatable
		visible="true"

		if self.visible
			 visible="true"
		else
			 visible="false"
		end
	end

	def alineacion_datatable
		formato=""
		if self.tipo=="Decimal"
			formato='style="text-align:right;"'
		end
		if self.tipo =="DateTime" or self.tipo=="Date"
			formato='style="text-align:center;"'
		end
		formato.html_safe
	end


	def formato_datatable(valor)
		def moneda (valor)
		    ActionController::Base.helpers.number_to_currency( valor, :unit=>"")
  		end

  		 def formato_fecha(fecha) 
  			if !fecha.nil?
  				fecha.strftime("%d/%m/%Y")
  			else
  				""
  			end
  		end

  		def formato_fecha_hora(fecha) 
    		if !fecha.nil?
      			fecha.strftime("%d/%m/%Y %H:%M:%S")
    		else
      			""
    		end
  		end
		resultado=valor

		if self.tipo=="Decimal"
			resultado = moneda(valor)
		end

		if self.tipo=="DateTime"
			resultado=formato_fecha(valor.to_date)
		end

		if self.tipo=="Date"
			resultado=formato_fecha(valor.to_date)
		end

		resultado		

		

	end
end
