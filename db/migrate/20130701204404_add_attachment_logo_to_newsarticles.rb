class AddAttachmentLogoToNewsarticles < ActiveRecord::Migration
  def self.up
    change_table :newsarticles do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :newsarticles, :logo
  end
end
