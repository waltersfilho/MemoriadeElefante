class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :nome
      t.float :salario
      t.string :funcao

      t.timestamps null: false
    end
  end
end
