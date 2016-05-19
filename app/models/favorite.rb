# Favorite uses polymorphism
# Some day this app would be upgraded so people can share albums and artists and songs
# This makes it unreasonable to add an attribute favorite. Instead use polymorphic associations 
class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorited, polymorphic: true

end
