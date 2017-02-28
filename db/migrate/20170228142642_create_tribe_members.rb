class CreateTribeMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :tribe_members do |t|
      t.references :tribe, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
