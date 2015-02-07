json.array!(@empleados) do |empleado|
  json.extract! empleado, :id, :nombre, :fecha_nacimiento, :area, :puesto, :sexo, :salario
  json.url empleado_url(empleado, format: :json)
end
