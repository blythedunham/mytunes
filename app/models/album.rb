class Album < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :artist
  has_many :songs, dependent: :delete_all
  has_one :favorite, as: :favorited, dependent: :delete

  validates :name, uniqueness: { scope: :artist_id, case_sensitive: false }, presence: true
  validates :artist, presence: true
  validates :user, presence: true
  
end
