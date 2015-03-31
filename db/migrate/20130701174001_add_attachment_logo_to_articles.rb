class AddAttachmentLogoToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :articles, :logo
  end
end
