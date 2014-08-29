class Comment < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :photo
  belongs_to :user
end
