class Comment < ApplicationRecord
  belongs_to :debate
  belongs_to :user, optional: true 
  belongs_to :coach, optional: true 
  has_one_attached :image
  has_one_attached :video

  # comment = Comment.last
  # comment.video.attach( 
  #   io: File.open,
  #   filename: "video",
  #   content_type: "text/plain"
  #   )

    validates :content, presence: true, unless: :was_attached?
    
  def was_attached?
    self.video.attached? || self.image.attached?
  end
  
  def is_attached?
  end

end
