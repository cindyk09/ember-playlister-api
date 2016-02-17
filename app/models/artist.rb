class Artist < ActiveRecord::Base
  has_many :collaborations
  has_many :songs, through: :collaborations
  has_many :albums,  -> { uniq }, through: :songs
end
