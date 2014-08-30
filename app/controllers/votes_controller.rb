class VotesController < ApplicationController

  def create
    @photos = Photo.all  ## WHY DO WE NEED THIS LINE (WE DO, BUT I DON'T KNOW WHY)
    @context = context
    @vote = Vote.create(user_id: current_user.id, votable_id: context.id, votable_type: context_type)
    #photo = Photo.find(params[:photo_id])
    10.times {p context.inspect}
    10.times {p params}
    #vote = photo.votes.new(user_id: current_user.id, votable_id: photo.id, votable_type: "Photo")
    if current_user.already_voted_this?(context, context_type)
      render 'photos/index' and return
    else
      @vote.save
      redirect_to photo_path(photo)
    end
  end

private
  def vote_params
    params.require(:vote).permit(:user_id, :votable_id)
  end

  def votable_is_photo?
    params[:photo_id] ? true : false
  end

  def context
    if params[:photo_id]
      return Photo.find(params[:photo_id])
    else
      return Comment.find(params[:comment_id])
    end
  end

  def context_type
    if params[:photo_id]
      return "Photo"
    else
      return "Comment"
    end
  end

end
