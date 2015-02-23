class AddRightAndIsaccessibleToUser < ActiveRecord::Migration
  def change
  	add_column :users, :using_level, :integer
  	add_column :users, :is_accessible, :boolean
  end
end
