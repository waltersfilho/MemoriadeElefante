class RemoveCargoEleitoToPoliticos < ActiveRecord::Migration
  def change
    remove_column :politicos, :cargo_eleito, :string
  end
end
