class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :member_id
      t.string :user_id
    end
  end
end
