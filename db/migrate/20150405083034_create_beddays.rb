class CreateBeddays < ActiveRecord::Migration
  def change
    create_table :beddays do |t|
      t.integer :remaining, default: 30
      t.references :client, index: true

      t.timestamps
    end
  end
end
