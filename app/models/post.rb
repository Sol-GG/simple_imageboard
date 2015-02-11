class Post < ActiveRecord::Base
	belongs_to :topic
	validates :topic, presence: true 
	validates :topic_id, presence: true 
	default_scope -> { order('updated_at ASC') }
	validates :content, presence: true, length: { maximum: 1600 }
end
