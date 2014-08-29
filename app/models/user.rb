class User < ActiveRecord::Base
  validates :email, presence: true
  validates :password, presence: true

  has_many :photos
  has_many :comments, through: :photos
  has_many :votes

  has_secure_password
end
