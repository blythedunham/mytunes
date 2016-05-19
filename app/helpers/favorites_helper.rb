module FavoritesHelper

  #Convert record to a favorite id
  def fid(object)
    if object.is_a?(Favorite)
      [ object.favorited_id, object.favorited_type ]
    else
      [ object.to_param, object.model_name.to_s ]
    end.join("_")
  end

end
