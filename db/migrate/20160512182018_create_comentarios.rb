class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :mensagem

      t.timestamps null: false
    end
  end
end
