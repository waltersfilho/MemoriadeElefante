class AddLegendaToPartido < ActiveRecord::Migration
  def change
    add_column :partidos, :Partido, :string
    add_column :partidos, :legenda, :integer
  end
end
