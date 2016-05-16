class AddDescricaoToPoliticos < ActiveRecord::Migration
  def change
    add_column :politicos, :descricao, :string
  end
end
