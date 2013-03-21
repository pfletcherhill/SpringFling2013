class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :artist_id
      t.string :url
      
    end
  end
end
