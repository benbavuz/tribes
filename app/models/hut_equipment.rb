class HutEquipment < ApplicationRecord
  belongs_to :equipment
  belongs_to :hut

  validates_uniqueness_of :hut_id, :scope => :equipment_id
end
