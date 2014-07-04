class Vote < ActiveRecord::Base

  has_many :songs
  belongs_to :user

  validates :artist_name, :song_name, :presence => true
end