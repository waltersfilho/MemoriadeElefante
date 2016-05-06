class CreatePartidos < ActiveRecord::Migration
  def change
    create_table :partidos do |t|
      t.string :nome
      t.string :descricao
      t.string :sigla
      t.integer :numero_politicos

      t.timestamps null: false
    end
  end
end
