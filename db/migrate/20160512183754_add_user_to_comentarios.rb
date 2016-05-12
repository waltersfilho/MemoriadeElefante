class AddUserToComentarios < ActiveRecord::Migration
  def change
    add_reference :comentarios, :user, index: true, foreign_key: true
  end
end
