class CreateAcontecimentos < ActiveRecord::Migration
  def change
    create_table :acontecimentos do |t|
      t.string :titulo
      t.string :descricao
      t.string :link

      t.timestamps null: false
    end
  end
end
