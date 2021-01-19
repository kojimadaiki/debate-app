class Comment < ApplicationRecord
  belongs_to :debate
  belongs_to :user, optional: true
  belongs_to :coach, optional: true
  has_one_attached :image
  has_one_attached :video

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    video.attached? || image.attached?
  end
end
