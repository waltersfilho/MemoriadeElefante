class CreatePoliticos < ActiveRecord::Migration
  def change
    create_table :politicos do |t|
      t.string :nome
      t.integer :idade
      t.string :estado
      t.string :cidade
      t.string :municipio
      t.references :partido, index: true, foreign_key: true
      t.string :cargo_eleito
      t.string :cargo_atual
      t.string :status

      t.timestamps null: false
    end
  end
end
