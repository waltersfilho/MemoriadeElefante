class AddDataPubToPoliticos < ActiveRecord::Migration
  def change
    add_column :politicos, :data_pub, :date
  end
end
