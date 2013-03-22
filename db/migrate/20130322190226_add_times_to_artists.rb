class AddTimesToArtists < ActiveRecord::Migration
  def change
    change_table :artists do |t|
      t.boolean :light
      t.string :time
    end
  end
end
