class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :albums
  has_one :favorite, as: :favorited

  validates :name, uniqueness: { scope: :user_id, case_sensitive: false }, presence: true
  validates :user, presence: true
end
