#!/usr/bin/env ruby

require 'sqlite3'

DB_FILE_NAME = "songs.sqlite3.db"
SQL_SELECT_GENRES = "Select name FROM genres;"
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

puts "Enter your choice"
choice = gets.chomp.to_i
puts "Your choice is number #{choice}"

def displayInfo
    puts "Here is everything in the database"
    #prints out the db list
    db.execute(SQL_SELECT_GENRES) do |row|
        puts row
    end
    db.close
end

def addGenre
    #prints out the genres list
    puts "Enter a genre"
    genre = gets.chomp.to_s

    db.execute("insert into genres(name) values(#{genre});") 
    db.execute(SQL_SELECT_GENRES) do |row|
        puts row
    end
    db.close
end

def addAlbum
    puts "Enter an album"
    album = gets.chomp.to_s
    db.execute("insert into albums")    
end

def addArtist
    puts "Enter an artist"
    artist = gets.chomp.to_s
    db.execute("insert into artists")
end

def addSong
    puts "Here is everything"
end


if choice == 1
   puts "Here is everything in the database"
    #prints out the db list
    db.execute(SQL_SELECT_GENRES) do |row|
        puts row
    end
    db.close

elsif choice == 2
   #prints out the genres list with added value
    puts "Enter a genre"
    genre = gets.chomp.to_s

    db.execute("insert into genres(name) values('#{genre}');") 
    db.execute(SQL_SELECT_GENRES) do |row|
        puts row
    end
    db.close

elsif choice == 3
   #prints out the album list with added value
    puts "Enter an album"
    album = gets.chomp.to_s

    db.execute("insert into albums(name) values('#{album}');") 
    db.execute(SQL_SELECT_ALBUMS) do |row|
        puts row
    end
    db.close

elsif choice == 4
   #prints out the artist list with added value
    puts "Enter an artist"
    artist = gets.chomp.to_s

    db.execute("insert into artists(name) values('#{artist}');") 
    db.execute(SQL_SELECT_ARTISTS) do |row|
        puts row
    end
    db.close

elsif choice == 5
    addSong

else
   puts "Invalid choice!"
end