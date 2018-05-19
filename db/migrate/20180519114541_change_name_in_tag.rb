class ChangeNameInTag < ActiveRecord::Migration[5.2]
  def change
    change_column :tags, :name, :string
  end
end
