require 'fileutils'
# spotify = RestClient.get("https://spotifycharts.com/api/?type=regional&country=global&recurrence=daily&date=latest&limit=200&offset=0")
# parsed = JSON.parse(spotify)

# File.open('db/fixtures/seed_data.yml', 'w') { |file| file.write(spotify) }


data = File.read('db/fixtures/seed_data.yml')
parsed = JSON.parse(data)
parsed["entries"]["items"].each do |item|
  album_name = item["track"]["album"]["name"]
  album = Album.where(name: album_name).first_or_create do |a|
    a.image_url = item["track"]["album"]["images"][0]["url"]
  end
  song_name = item["track"]["name"]

  song = Song.where(name: song_name).first_or_create do |s|
    s.album = album
  end

  item["track"]["artists"].each do |artist|
    artist_name = artist["name"]
    artist = Artist.where(name: artist_name).first_or_create
    artist.songs << song unless artist.songs.include?(song)
  end
end
