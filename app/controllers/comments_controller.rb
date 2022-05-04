class CommentsController < ApplicationController

def index
@comments = Comment.all
end
  def show
    @comments = Comment.all.find(params[:id])
  end

  end
end
