class AddAttachmentPhotoToAcontecimentos < ActiveRecord::Migration
  def self.up
    change_table :acontecimentos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :acontecimentos, :photo
  end
end
