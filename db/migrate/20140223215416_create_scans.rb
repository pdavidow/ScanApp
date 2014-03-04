class CreateScans < ActiveRecord::Migration
  def change
    create_table :scans do |t|
      t.integer :resort_id
      t.integer :ticket_id

      t.timestamp :timestamp

      t.timestamps
    end
  end
end
