class RemoveUserToPoliticos < ActiveRecord::Migration
  def change
    remove_reference :politicos, :user, index: true, foreign_key: true
  end
end
