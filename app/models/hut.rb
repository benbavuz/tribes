class Hut < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  # validates :zip_code, presence: true
  # validates :city, presence: true
  # validates :country, presence: true
  validates :capacity, presence: true

  has_many :hut_equipments
  has_many :equipments, through: :hut_equipments

  # implement methode to use geocode
  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?

  has_attachment :photo

  def full_address
    "#{address}, #{zip_code} #{city} #{country}"
  end

  def full_address_changed?
    address_changed? || zip_code_changed? || city_changed? || country_changed?
  end

  has_attachment :photo
  has_attachments :photos, :maximum => 4
end
