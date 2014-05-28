class RemoveFieldnameandmemberFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :member, :string
    remove_column :users, :fieldname, :string
  end
end
