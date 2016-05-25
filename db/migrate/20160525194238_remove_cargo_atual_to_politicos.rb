class RemoveCargoAtualToPoliticos < ActiveRecord::Migration
  def change
    remove_column :politicos, :cargo_atual, :string
  end
end
