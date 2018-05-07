class RemoveColumsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :string
    remove_column :users, :avatar, :string
    remove_column :users, :rating, :integer
  end
end
