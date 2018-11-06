class Note < ActiveRecord::Base
  belongs_to :song
  has_many :artists, through: :songs
  has_many :genres, through: :songs
  # add associations here
end
