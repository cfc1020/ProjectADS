class AddAttachmentPhotoToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :photo
      t.integer :ad_id
    end
  end

  def self.down
    drop_attached_file :images, :photo
  end
end
