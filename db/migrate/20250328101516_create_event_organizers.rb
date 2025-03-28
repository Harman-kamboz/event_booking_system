class CreateEventOrganizers < ActiveRecord::Migration[7.1]
  def change
    create_table :event_organizers do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
