json.array!(@reporte_filtros) do |reporte_filtro|
  json.extract! reporte_filtro, :id, :reporte_id, :etiqueta, :parametro, :valor_inicial, :tipo, :elementos
  json.url reporte_filtro_url(reporte_filtro, format: :json)
end
