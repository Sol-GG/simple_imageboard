class Topic < ActiveRecord::Base
	belongs_to :board
	default_scope -> { order('updated_at DESC') }
	validates :board_id, presence: true
end
