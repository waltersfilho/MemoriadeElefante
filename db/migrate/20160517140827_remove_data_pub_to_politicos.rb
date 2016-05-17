class RemoveDataPubToPoliticos < ActiveRecord::Migration
  def change
    remove_column :politicos, :data_pub, :date
  end
end
