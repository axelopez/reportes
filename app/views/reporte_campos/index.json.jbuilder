json.array!(@reporte_campos) do |reporte_campo|
  json.extract! reporte_campo, :id, :reporte_id, :campo, :descripcion, :tipo
  json.url reporte_campo_url(reporte_campo, format: :json)
end
