class CreateSkiResortCompanies < ActiveRecord::Migration
  def change
    create_table :ski_resort_companies do |t|

      t.timestamps
    end
  end
end
