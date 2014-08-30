class VotesController < ApplicationController

  def create
    @photos = Photo.all  ## WHY DO WE NEED THIS LINE (WE DO, BUT I DON'T KNOW WHY)
    photo = Photo.find(params[:photo_id])
    vote = photo.votes.new(user_id: session[:user_id], votable_id: photo.id, votable_type: "Photo", value: 1)
    if current_user.already_voted_this_photo?(photo)
      render 'photos/index' and return
    else
      vote.save
      redirect_to photo_path(photo)
    end
  end

  def check_previous_vote
    # user_votes = Vote.where(user_id: vote.user_id)
    # if Vote.exists?(user_id: vote.user_id)
    #   user_votes.each do |v|
    #     if v.votable_id == vote.votable_id && v.votable_type == vote.votable_type
    #       render 'photos/index' and return
    #     else
    #       if vote.save
    #          render 'photos/index' and return
    #       else
    #         render 'photos/index' and return
    #       end
    #     end
    #   end
    # else
    #     render 'photos/index' and return

    # end
    # # redirect_to photos_path and return
  end


end
