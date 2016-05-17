class AddDataPubToAcontecimentos < ActiveRecord::Migration
  def change
    add_column :acontecimentos, :data_pub, :date
  end
end
