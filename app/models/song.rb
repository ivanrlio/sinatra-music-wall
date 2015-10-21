class Song < ActiveRecord::Base

  belongs_to :user
  has_many :upvotes

  validates :title, presence: true
  validates :url, presence: true
  validates :user_id, presence: true

end