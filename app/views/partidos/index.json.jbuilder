json.array!(@partidos) do |partido|
  json.extract! partido, :id, :nome, :descricao, :sigla, :numero_politicos
  json.url partido_url(partido, format: :json)
end
