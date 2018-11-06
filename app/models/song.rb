class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes



  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(content)
    content.each do |note|
     new_note = Note.find_or_create_by(content: note)
     self.notes << new_note
    end
   

  end

  def note_contents
    array = []
    if self.notes
      self.notes.each {|n| array << n.content if n.content.length > 0}
      array
    else
      nil
    end
  end
end