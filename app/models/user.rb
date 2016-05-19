class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :artists
  has_many :albums
  has_many :songs

  has_many :favorites
  has_many :favorite_artists, through: :favorites, source: :favorited, source_type: 'Artist'
  has_many :favorite_albums,  through: :favorites, source: :favorited, source_type: 'Album'
  has_many :favorite_songs,   through: :favorites, source: :favorited, source_type: 'Song'



end
