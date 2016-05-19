class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorited, polymorphic: true


  def fid
    [favorited_id,favorited_type].join("|")
  end

end
