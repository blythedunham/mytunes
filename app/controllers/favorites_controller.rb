class FavoritesController < ApplicationController
  
  before_filter :authenticate_user!

  # This is a protoype! If we are to expand our application so users can share artists, then we cannot have
  # the favorite field on the artist, album and song records
  def create
    @favorite = current_user.favorites.create(favorited_id:params[:favorited_id], favorited_type: params[:favorited_type])
    logger.debug "FAV " + @favorite.to_s
    respond_to do |format|
      format.js
    end
  end
  

  def destroy
    @favorite = current_user.favorites.find_by_id(params[:id])

    #Favorite.where(id:@favorite user_id: current_user.id).first.destroy if @favorite
    respond_to do |format|
      if @favorite
        @favorited = @favorite.favorited
        @favorite.destroy if @favorite
        format.js
      else
        render nothing:true # the user probably clicked it twice so dont do anything
      end
    end
  end

end
