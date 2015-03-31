class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :header
      t.string :teaser
      t.text :text
      t.integer :position

      t.timestamps
    end
  end
end
