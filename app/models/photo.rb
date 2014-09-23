class Photo < ActiveRecord::Base
  validates :image_name, presence: true

  dragonfly_accessor :image

  validates :image, presence: true
  validates_size_of :image, maximum: 500.kilobytes,
                    message: "should be no more than 500 KB", if: :image_changed?
 
  validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false,
                     message: "should be either .jpeg, .jpg, .png, .bmp", if: :image_changed?

  has_many :comments
  has_many :votes, as: :votable
  belongs_to :user

  scope :top20,
    select("photos.id, count(votes.id) AS votes_count").
    joins(:votes).
    group("photos.id").
    order("votes_count DESC").
    limit(20)

  dragonfly_accessor :image do
    after_assign do |img|
      img.encode!('jpg', '-quality 80') if img.image?
    end
  end
end
