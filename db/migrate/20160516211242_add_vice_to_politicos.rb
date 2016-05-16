class AddViceToPoliticos < ActiveRecord::Migration
  def change
    add_column :politicos, :vice, :string
  end
end
