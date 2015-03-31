class CreateNewsarticles < ActiveRecord::Migration
  def change
    create_table :newsarticles do |t|
      t.string :alias
      t.string :header
      t.string :teaser
      t.text :text
      t.integer :position
      t.integer :views
      t.datetime :dt

      t.timestamps
    end
  end
end
