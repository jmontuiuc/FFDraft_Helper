class AddPositionToFantasyValues < ActiveRecord::Migration
  def change
    add_column :fantasy_values, :position, :string
  end
end
