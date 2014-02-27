class CreateTicketStates < ActiveRecord::Migration
  def change
    create_table :ticket_states do |t|
      t.integer :ticket_id

      t.string :type #STI

      t.timestamps
    end
  end
end
