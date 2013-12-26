class CreateTrafficEvents < ActiveRecord::Migration
  def change
    create_table :traffic_events do |t|
      t.string :event_id
      t.string :event_state
      t.string :event_class
      t.string :event_type
      t.string :report_org_id
      t.string :facility_name
      t.string :direction
      t.string :article_code
      t.string :from_loc_point
      t.string :to_loc_point
      t.datetime :create_time
      t.datetime :last_update
      t.string :event_description
      t.string :city
      t.string :county
      t.string :state
      t.integer :est_duration
      t.float :latitude
      t.float :longitude
      t.float :to_lat
      t.float :to_long
      t.integer :lanes_affected
      t.string :lane_status
      t.integer :total_lanes
      t.string :lane_description
      t.string :lane_detail
      t.integer :update_number
      t.string :respond_org_id
      t.string :pavement_condition
      t.string :weather_condition
      t.datetime :start_date
      t.datetime :end_date
      t.string :event_other_desc
      t.string :from_mile_marker
      t.boolean :local_only
      t.string :construction_type
      t.string :confirmation_code
      t.integer :closure_type

      t.timestamps
    end
  end
end
