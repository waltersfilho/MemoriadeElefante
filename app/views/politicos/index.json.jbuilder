json.array!(@politicos) do |politico|
  json.extract! politico, :id, :nome, :idade, :estado, :cidade, :municipio, :partido_id, :cargo_eleito, :cargo_atual, :status
  json.url politico_url(politico, format: :json)
end
