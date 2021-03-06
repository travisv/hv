# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_150_405_083_034) do
  create_table 'beddays', force: true do |t|
    t.integer 'remaining',  default: 30
    t.integer 'client_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'beddays', ['client_id'], name: 'index_beddays_on_client_id'

  create_table 'clients', force: true do |t|
    t.string 'name'
    t.string 'titleXIX'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'homevisits', force: true do |t|
    t.date 'departure_date'
    t.date 'return_date'
    t.integer 'client_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'homevisits', ['client_id'], name: 'index_homevisits_on_client_id'
end
