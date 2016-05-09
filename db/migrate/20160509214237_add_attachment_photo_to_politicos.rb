class AddAttachmentPhotoToPoliticos < ActiveRecord::Migration
  def self.up
    change_table :politicos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :politicos, :photo
  end
end
