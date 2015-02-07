json.array!(@reportes) do |reporte|
  json.extract! reporte, :id, :titulo, :area, :descripcion, :sql, :activo
  json.url reporte_url(reporte, format: :json)
end
