class CreateBedDays < ActiveRecord::Migration
  def change
    create_table :bed_days do |t|
      t.references :client, index: true

      t.timestamps
    end
  end
end
