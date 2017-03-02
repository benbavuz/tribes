class AddShortDescriptionToTribes < ActiveRecord::Migration[5.0]
  def change
  add_column :tribes, :short_desk, :string
  end
end
