json.array!(@cargos) do |cargo|
  json.extract! cargo, :id, :nome, :salario, :funcao
  json.url cargo_url(cargo, format: :json)
end
