class VotesController < ApplicationController
before_action :authenticate_user!

def get_yes_votes
  @yes = 0
  @votes = Votes.find_by(restaurant_id: :restaurant_id)
  @yes_votes = @votes.find_by(type: "Yes")
end

def get_no_votes
  @no = 0
  @votes = Votes.find_by(restaurant_id: :restaurant_id)
  @no_votes = @votes.find_by(type: "No")
end

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
