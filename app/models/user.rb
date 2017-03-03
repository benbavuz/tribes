class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :tribe_members
  has_many :tribes, through: :tribe_members
  has_many :huts
  has_many :user_skills
  has_many :skills, through: :user_skills

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
