class Board < ApplicationRecord
  has_many :coaches
  has_many :users

  validates :title, presence: true, unless: :user_signed_in
  validates :start_time, presence: true

  def user_signed_in
    User.present?
  end
end
