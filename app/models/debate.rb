class Debate < ApplicationRecord
  has_many :debate_coaches, dependent: :destroy
  has_many :coaches, through: :debate_coaches, validate: false, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
end
