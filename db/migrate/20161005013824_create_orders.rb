class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.float :total_paid
      t.references :venue
      t.references :user

      t.timestamps
    end
  end
end
