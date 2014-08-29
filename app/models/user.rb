class User < ActiveRecord::Base
  validates :email, presence: true
  validates :password, presence: true
  validates_uniqueness_of :email
  validates_confirmation_of :password, message: "Password doesn't match"

  has_many :photos
  has_many :comments, through: :photos
  has_many :votes

  has_secure_password
end
