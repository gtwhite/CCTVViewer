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

ActiveRecord::Schema.define(version: 20131226015616) do

  create_table "cctvs", force: true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location"
    t.string   "url"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "traffic_events", force: true do |t|
    t.string   "event_id"
    t.string   "event_state"
    t.string   "event_class"
    t.string   "event_type"
    t.string   "report_org_id"
    t.string   "facility_name"
    t.string   "direction"
    t.string   "article_code"
    t.string   "from_loc_point"
    t.string   "to_loc_point"
    t.datetime "create_time"
    t.datetime "last_update"
    t.string   "event_description"
    t.string   "city"
    t.string   "county"
    t.string   "state"
    t.integer  "est_duration"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "to_lat"
    t.float    "to_long"
    t.integer  "lanes_affected"
    t.string   "lane_status"
    t.integer  "total_lanes"
    t.string   "lane_description"
    t.string   "lane_detail"
    t.integer  "update_number"
    t.string   "respond_org_id"
    t.string   "pavement_condition"
    t.string   "weather_condition"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "event_other_desc"
    t.string   "from_mile_marker"
    t.boolean  "local_only"
    t.string   "construction_type"
    t.string   "confirmation_code"
    t.integer  "closure_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
