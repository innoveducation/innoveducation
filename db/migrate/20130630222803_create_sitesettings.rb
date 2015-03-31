class CreateSitesettings < ActiveRecord::Migration
  def change
    create_table :sitesettings do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.text :footerleft
      t.text :phones
      t.text :email
      t.text :skype
      t.text :address
      t.text :copyright

      t.timestamps
    end
  end
end
