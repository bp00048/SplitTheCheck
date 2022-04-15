class VotesController < ApplicationController
before_action :authenticate_user!

    def create
      @vote = current_user.votes.new(vote_params)
      if !@vote.save
      flash[:notice] = @vote.errors.full_messages.to_sentence
      end
    redirect_to @vote.restaurant
  end

  private
  def vote_params
    params.require(:vote).permit(:restaurant_id, :vote_type)
  end
end
