class RemoveBeddays < ActiveRecord::Migration
  def up
    drop_table :beddays
    drop_table :bed_days
  end
end
