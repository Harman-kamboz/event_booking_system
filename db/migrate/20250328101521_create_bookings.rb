class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :customer, foreign_key: true
      t.references :event, foreign_key: true
      t.references :ticket, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
