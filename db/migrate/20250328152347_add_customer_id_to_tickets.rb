class AddCustomerIdToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :customer_id, :bigint
  end
end
