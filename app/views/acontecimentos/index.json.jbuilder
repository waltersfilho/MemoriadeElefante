json.array!(@acontecimentos) do |acontecimento|
  json.extract! acontecimento, :id, :titulo, :descricao, :link
  json.url acontecimento_url(acontecimento, format: :json)
end
