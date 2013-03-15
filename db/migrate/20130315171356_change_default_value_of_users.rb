class ChangeDefaultValueOfUsers < ActiveRecord::Migration
  def up
    change_column :users, :role, :string, :default => "manager"
  end

  def down
    change_column :users, :role, :string, :default => ""
  end
end
