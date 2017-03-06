class Tribe < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :short_desk, length: { maximum: 30 }

  has_many :tribe_members, dependent: :destroy
  has_many :users, through: :tribe_members

  has_attachment :photo

  def skills_tribe
    skills = []
    users.each do |user|
      user.skills.each do |skill|
       skills << skill.name
      end
    end
    return skills
  end

  def coordinates
  user_ids = TribeMember.where(tribe_id: self.id).pluck(:user_id)
  huts = Hut.where(user_id: user_ids).where("latitude is not null and longitude is not null")
    hash = Gmaps4rails.build_markers(huts) do |hut, marker|
      marker.lat hut.latitude
      marker.lng hut.longitude
    end
  return hash
  end
end
