class BoardsController < ApplicationController
  def show
  	@board=Board.find_by_tag(params[:tag])
  	if !@board
  		redirect_to root_path
  	else
  		@topics=@board.topics.all()
  		@new_topic = @board.topics.build
  	end
  end
end
