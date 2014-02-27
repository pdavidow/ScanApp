class CreateSkiResorts < ActiveRecord::Migration
  def change
    create_table :ski_resorts do |t|
      t.integer :company_id

      t.string :name
      t.integer :scan_wait_seconds

      t.string :type #STI

      t.timestamps
    end
  end
end
