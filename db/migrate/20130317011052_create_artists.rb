class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :param
      t.string :name
      t.text :about
      
    end
  end
end
