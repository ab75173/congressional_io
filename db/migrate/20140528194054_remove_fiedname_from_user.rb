class RemoveFiednameFromUser < ActiveRecord::Migration
  def down
    remove_column :users, :fieldname
  end
end
