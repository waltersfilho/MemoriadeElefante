class AddCargoToPoliticos < ActiveRecord::Migration
  def change
    add_reference :politicos, :cargo, index: true, foreign_key: true
  end
end
