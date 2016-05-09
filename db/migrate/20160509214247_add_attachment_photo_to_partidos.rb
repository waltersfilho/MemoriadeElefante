class AddAttachmentPhotoToPartidos < ActiveRecord::Migration
  def self.up
    change_table :partidos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :partidos, :photo
  end
end
