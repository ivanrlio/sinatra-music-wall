class User < ActiveRecord::Base

  has_many :songs
  has_many :upvotes

  validates :username, presence: true
  validates :first_name, presence: true
  validates :password, presence: true

end