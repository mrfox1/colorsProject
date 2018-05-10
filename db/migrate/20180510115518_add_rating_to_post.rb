class AddRatingToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :rating, :integer, default: 0
  end
end
