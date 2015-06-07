class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :friend1
      t.integer :friend2
    end
  end
end
