class User < ActiveRecord::Base
  has_many :topics, foreign_key: "requester_id"
  has_many :posts, through: :topics

  validates_uniqueness_of :name, :email
  validates_presence_of :name, :email
  has_secure_password
end
