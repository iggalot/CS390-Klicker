class QuestionsController < ApplicationController
	def create
		@room = Room.find(params[:room_id])
		@question = @room.questions.create(question_params)
		redirect_to room_path(@room)
	end

	private
		def question_params
			params.require(:question).permit(:body)
		end
end
