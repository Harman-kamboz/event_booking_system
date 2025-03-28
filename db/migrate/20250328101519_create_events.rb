class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :venue
      t.references :event_organizer, foreign_key: true

      t.timestamps
    end
  end
end
