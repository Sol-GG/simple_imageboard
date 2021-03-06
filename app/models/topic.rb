class Topic < ActiveRecord::Base
	has_many :posts, inverse_of: :topic
	accepts_nested_attributes_for :posts
	validates :posts, presence: true
	
	belongs_to :board
	validates :board, presence: true 
	default_scope -> { order('updated_at DESC') }
	validates :board_id, presence: true
	validates :caption, presence: true, length: { maximum: 140 }
end
