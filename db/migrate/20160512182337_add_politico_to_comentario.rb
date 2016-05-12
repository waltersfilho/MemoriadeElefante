class AddPoliticoToComentario < ActiveRecord::Migration
  def change
    add_reference :comentarios, :politico, index: true, foreign_key: true
  end
end
