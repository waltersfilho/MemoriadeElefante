class AddUserToPoliticos < ActiveRecord::Migration
  def change
    add_reference :politicos, :user, index: true, foreign_key: true
  end
end
