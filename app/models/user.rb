class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :tribe_members
  has_many :tribes, through: :tribe_members

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
