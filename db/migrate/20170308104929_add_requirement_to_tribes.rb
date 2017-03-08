class AddRequirementToTribes < ActiveRecord::Migration[5.0]
  def change
    add_column :tribes, :requirement, :text
  end
end
