class Board < ApplicationRecord
  has_many :coaches

  with_options presence: true do
    validates :start_time
    validates :title
  end
end
