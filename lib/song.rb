require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |a| a.name }
  end

  def self.new_from_filename(string)
    song = self.find_or_create_by_name(string)
    data = string.split(/[-,.]/)
    data.delete(/\s/)
    artist_name = data[0]
    name = data[1]
    song.artist_name = artist_name
    song.name = name
    song
    #binding.pry
    #mp3 = data[2]
  end


end
