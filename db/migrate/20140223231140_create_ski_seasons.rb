class CreateSkiSeasons < ActiveRecord::Migration
  def change
    create_table :ski_seasons do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
