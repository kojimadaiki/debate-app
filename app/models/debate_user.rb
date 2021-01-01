class DebateUser < ApplicationRecord
  belongs_to :debate
  belongs_to :user
end
