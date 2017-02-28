class Equipment < ApplicationRecord
  has_many :hut_equipments

  validates :name, uniqueness: true, presence: true
end
