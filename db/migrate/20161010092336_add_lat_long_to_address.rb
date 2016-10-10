class AddLatLongToAddress < ActiveRecord::Migration[5.0]
  def up
    change_table :addresses do |t|
      t.float :latitude
      t.float :longitude
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
