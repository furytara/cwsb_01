class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.integer :space_type, null: false
      t.integer :size, null: false
      t.integer :capicity, null: false
      t.integer :quantity, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.references :venue, index: true, foreign_key: true

      t.timestamps
    end
  end
end
