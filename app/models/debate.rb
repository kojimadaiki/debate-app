class Debate < ApplicationRecord
  has_many :users, through: :debate_users
  has_many :coaches, through: :debate_coaches
  has_many :debate_users
  has_many :debate_coaches
end
