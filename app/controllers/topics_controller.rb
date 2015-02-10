class TopicsController < ApplicationController

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:success] = "Thread successfuly created!"
    end
    redirect_to '/'+Board.find(@topic.board_id).tag
  end


	private

	    def topic_params
	      params.require(:topic).permit(:caption, :board_id)
	    end
end
