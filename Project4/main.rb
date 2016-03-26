#Roberto Hernandez 
#Project 4
#Music Database 
#lets you see songs stored in a sqlite3 database & lets you addd new artist, albums, genres and songs
#!/usr/bin/env ruby


require 'sqlite3'


DB_FILE_NAME = "songs.sqlite3.db"
SQL_SELECT_GENRES = "Select name FROM genres;"
SQL_SELECT_SONGS_GENRES_ALBUM = "SELECT songs.name, genres.name, artists.name, albums.name FROM songs, genres, artists, albums WHERE artists.id = albums.artist_id AND genres.id = songs.genre_id AND albums.id = songs.album_id;"
SQL_SELECT_ALBUMS = "Select name FROM albums;"
SQL_SELECT_ARTISTS = "Select name FROM artists;"
SQL_SELECT_SONGS = "Select name FROM songs;"


db = SQLite3::Database.new(DB_FILE_NAME)


puts "Welcome to RobTunes!"
puts "1. Display all song information"
puts "2. Add a new genre"
puts "3. Add a new album"
puts "4. Add a new artist"
puts "5. Add a new song"
puts "6. Exit Program"


puts "Enter your choice"
choice = gets.chomp.to_i
puts "Your choice is number #{choice}\n"


def choice1(db)
  puts "Song Information:"
  #prints out the db list
  db.execute(SQL_SELECT_SONGS) do |row|
    puts row.join " - "
  end
  db.close
end

def choice2(db)
  #prints out the genres list with added value
  puts "Enter a genre"
  genre = gets.chomp.to_s

  db.execute("insert into genres(name) values('#{genre}');") 
  db.execute(SQL_SELECT_GENRES) do |row|
    puts row
  end
  db.close
end

def choice3(db)
  #prints out the album list with added value
  puts "Enter an album"
  album = gets.chomp.to_s
  
  puts"Artist:"
  db.execute("Select * from artists;") do |row|
    puts "#{row[0]}. #{row[1]}"
  end
  puts "Select artist:"
  artist_id = gets.chomp.to_i

  db.execute("insert into albums(name, artist_id) values('#{album}', '#{artist_id}');") 
  puts "Album has been added!"
  db.execute(SQL_SELECT_ALBUMS) do |row|
    puts row
  end
  db.close
end

def choice4(db)
  #prints out the artist list with added value
  puts "Enter an artist"
  artist = gets.chomp.to_s

  db.execute("insert into artists(name) values('#{artist}');") 
  puts "Artist has been added!"
  db.execute(SQL_SELECT_ARTISTS) do |row|
    puts row
  end
  db.close
end

def choice5(db)
  #assign albums artist and genre from the database to the song
  puts "Enter a song name"
  song = gets.chomp.to_s

  
  puts "Albums:"
  db.execute("Select * from albums;") do |row|
    puts "#{row[0]}. #{row[1]}"
  end
  puts "Select album:"
  album_id = gets.chomp.to_i

  
  puts "Genres:"
  db.execute("Select * from genres;") do |row|
    puts "#{row[0]}. #{row[1]}"
  end
  puts "Select genre:"
  genre_id = gets.chomp.to_i  

  
  db.execute("insert into songs(name, genre_id, album_id) values('#{song}', #{genre_id}, #{album_id});")
  puts "Song has been added!"
  db.execute(SQL_SELECT_SONGS) do |row|
    puts row
  end
  db.close
end


if choice == 1
  choice1(db)
elsif choice == 2
  choice2(db)
elsif choice == 3
  choice3(db)
elsif choice == 4
  choice4(db)
elsif choice == 5
  choice5(db)
elsif choice == 6
  puts "Goodbye"
else
  puts "Invalid choice!"
end

