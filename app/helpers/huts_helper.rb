module HutsHelper
  def equipments_collection
    Equipment.all.order(:name)
  end
end
