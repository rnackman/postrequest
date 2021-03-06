class Topic < ActiveRecord::Base
  belongs_to :requester, class_name: "User"
  has_one :post, dependent: :destroy
  has_one :writer, through: :post

  validates_presence_of :name
end
