class Photo < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true

  has_many :comments
  has_many :votes, as: :votable
  belongs_to :user
end
