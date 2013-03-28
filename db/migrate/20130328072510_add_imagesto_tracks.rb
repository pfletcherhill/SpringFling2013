class AddImagestoTracks < ActiveRecord::Migration
  def change
    change_table :tracks do |t|
      t.string :image
    end
  end
end
