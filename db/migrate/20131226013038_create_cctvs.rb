class CreateCctvs < ActiveRecord::Migration
  def change
    create_table :cctvs do |t|
      t.float :latitude
      t.float :longitude
      t.string :location
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
