class AddParentMoodToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :parent_mood, :string
  end
end
