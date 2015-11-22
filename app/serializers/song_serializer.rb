class SongSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :album
end
