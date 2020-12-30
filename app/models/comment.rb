class Comment < ApplicationRecord
  belongs_to :debate
  belongs_to :user
  belongs_to :coach
  # has_one_attached :image
end
