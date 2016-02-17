class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.belongs_to :artist, index: true, foreign_key: true
      t.belongs_to :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
