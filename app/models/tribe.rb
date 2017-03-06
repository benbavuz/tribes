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
end
