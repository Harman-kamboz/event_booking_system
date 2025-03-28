class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.references :event, foreign_key: true
      t.string :ticket_type
      t.decimal :price
      t.integer :available_quantity

      t.timestamps
    end
  end
end
