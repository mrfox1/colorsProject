class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :avatar
      t.integer :rating, default: 0
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
