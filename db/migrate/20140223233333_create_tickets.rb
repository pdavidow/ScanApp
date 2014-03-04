class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :company_id
      t.string :code

      t.string :type #STI

      t.timestamps
    end
  end
end