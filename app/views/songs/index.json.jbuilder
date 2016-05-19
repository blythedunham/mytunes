json.array!(@songs) do |song|
  json.extract! song, :id, :name, :length, :album_id_id, :user_id_id
  json.url song_url(song, format: :json)
end
