class AddCoordinatesToHuts < ActiveRecord::Migration[5.0]
  def change
    add_column :huts, :latitude, :float
    add_column :huts, :longitude, :float
  end
end
