class Coach < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :debates
  has_many :comments
  belongs_to :bulletin_board

  with_options presence: true do
    validates :name
    validates :teach_style
  end 
end
