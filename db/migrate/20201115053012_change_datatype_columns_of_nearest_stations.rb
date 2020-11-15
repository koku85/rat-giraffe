class ChangeDatatypeColumnsOfNearestStations < ActiveRecord::Migration[5.2]
  def change
    change_column :nearest_stations, :line_name, :string
    change_column :nearest_stations, :station_name, :string
  end
end
