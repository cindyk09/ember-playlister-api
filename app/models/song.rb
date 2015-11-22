class Song < ActiveRecord::Base
  belongs_to :album
  has_many :collaborations
  has_many :artists, through: :collaborations
end
