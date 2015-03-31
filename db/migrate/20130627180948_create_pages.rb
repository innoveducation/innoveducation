class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :alias
      t.string :name
      t.string :title
      t.string :keywords
      t.string :description
      t.text :content1
      t.text :content2
      t.boolean :showinmenu
      t.boolean :hastemplate
      t.string :partialname
      t.integer :position
      t.string :ancestry

      t.timestamps
    end
  end
end
