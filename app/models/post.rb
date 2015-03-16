class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :writer, class_name: "User"

  validates_presence_of :topic_id, :writer_id, :status
end
