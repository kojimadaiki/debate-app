class Debate < ApplicationRecord
  has_many :debate_users, dependent: :destroy
  has_many :users, through: :debate_users, validate: false
  has_many :debate_coaches, dependent: :destroy
  has_many :coaches, through: :debate_coaches, validate: false
  has_many :comments

  validates :name, presence: true
end
