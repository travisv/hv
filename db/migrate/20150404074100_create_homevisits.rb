class CreateHomevisits < ActiveRecord::Migration
  def change
    create_table :homevisits do |t|
      t.date :departure_date
      t.date :return_date
      t.references :client, index: true

      t.timestamps
    end
  end
end
