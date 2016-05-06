class RemovePartidoFromPartidos < ActiveRecord::Migration
  def change
    remove_column :partidos, :Partido, :string
  end
end
