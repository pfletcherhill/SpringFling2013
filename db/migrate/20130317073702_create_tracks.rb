class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :artist_id
      t.string :name
      t.string :youtube_url
      
    end
  end
end
