class TopicsController < ApplicationController

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      
      flash[:success] = "Thread successfuly created!"
      #flash[:success] = topic_params
    else
      @topic.errors.full_messages.each do |error_msg| 
        flash[:error] = error_msg
        #flash[:error] = topic_params
      end
    end
    #flash[:error] = @topic
    redirect_to '/'+Board.find(@topic.board_id).tag
  end


	private

	    def topic_params
        posts_attributes = {
          posts_attributes: [:content]
        }
	      params.require(:topic).permit(:caption, :board_id, posts_attributes)
	    end
end
