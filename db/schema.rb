# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130328072510) do

  create_table "artists", :force => true do |t|
    t.string  "param"
    t.string  "name"
    t.text    "about"
    t.boolean "light"
    t.string  "time"
  end

  create_table "images", :force => true do |t|
    t.integer "artist_id"
    t.string  "url"
  end

  create_table "tracks", :force => true do |t|
    t.integer "artist_id"
    t.string  "name"
    t.string  "youtube_url"
    t.string  "image"
  end

end
