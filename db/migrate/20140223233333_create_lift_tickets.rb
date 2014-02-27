class CreateLiftTickets < ActiveRecord::Migration
  def change
    create_table :lift_tickets do |t|
      t.integer :issuer_id
      t.integer :season_id
      t.integer :state_id

      t.string :type #STI

      t.timestamps
    end
  end
end
