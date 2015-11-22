class Album < ActiveRecord::Base
  has_many :songs
  has_many :artists,  -> { uniq }, through: :songs
end
