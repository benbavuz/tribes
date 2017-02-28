class CreateHutEquipments < ActiveRecord::Migration[5.0]
  def change
    create_table :hut_equipments do |t|
      t.string :comment
      t.references :equipment, foreign_key: true
      t.references :hut, foreign_key: true

      t.timestamps
    end
  end
end
