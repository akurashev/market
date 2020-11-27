class AddGroupToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :group, :integer
  end
end
