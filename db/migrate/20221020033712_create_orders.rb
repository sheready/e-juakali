class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :date_ordered
      t.decimal :total

      t.timestamps
    end
  end
end
