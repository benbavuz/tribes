class CreateHuts < ActiveRecord::Migration[5.0]
  def change
    create_table :huts do |t|
      t.string :name
      t.string :address
      t.string :address2
      t.string :zip_code
      t.string :city
      t.string :country
      t.string :about
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
