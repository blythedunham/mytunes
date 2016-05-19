class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  
  validates :name, uniqueness: { scope: :album_id, case_sensitive: false }, presence: true
  validates :album, presence: true
  validates :user,  presence: true

  has_one :favorite, as: :favorited

  # search songs with a name, album or artist by the term 
  scope :search, ->(term) { 
    joins({album: :artist}).
    where('albums.name like ? OR artists.name like ? OR songs.name like ?', term, term, term).
    order(:name)
  }

end


