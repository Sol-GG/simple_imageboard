class TopicsController < ApplicationController

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:success] = "Thread successfuly created!"
    else
      @topic.errors.full_messages.each do |error_msg| 
        flash[:error] = error_msg
      end
    end
    redirect_to '/'+Board.find(@topic.board_id).tag
  end


  def show
    board=Board.find_by(tag: params[:tag])
    post = Post.find_by(id: params[:post])
    if(board && post && post.topic.board==board)
      @full=true
      @topic=post.topic
    else
      flash[:error] = "Thread not found"
      redirect_to '/' + if board then board.tag else "" end
    end
  end


	private

	    def topic_params
        posts_attributes = {
          posts_attributes: [:content]
        }
	      params.require(:topic).permit(:caption, :board_id, posts_attributes)
	    end
end
