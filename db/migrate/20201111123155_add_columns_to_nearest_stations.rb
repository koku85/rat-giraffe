class AddColumnsToNearestStations < ActiveRecord::Migration[5.2]
  def change
    add_column :nearest_stations, :line_name, :text
    add_column :nearest_stations, :station_name, :text
    add_column :nearest_stations, :minutes_walk, :integer
  end
end
