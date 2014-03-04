class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|
      t.integer :company_id

      t.string :name
      t.integer :scan_wait_seconds

      t.string :type #STI

      t.timestamps
    end
  end
end
