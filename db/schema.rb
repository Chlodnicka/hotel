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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160918104857) do

  create_table "hotel_places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "street"
    t.integer  "numer"
    t.string   "city_code"
    t.string   "city"
    t.string   "phone_numbers"
    t.string   "email_addresses"
    t.text     "description",     limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "multimedia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.string   "image"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "multimedia_hotels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "hotel_place_id"
    t.integer  "multimedia_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["hotel_place_id"], name: "index_multimedia_hotels_on_hotel_place_id", using: :btree
    t.index ["multimedia_id"], name: "index_multimedia_hotels_on_multimedia_id", using: :btree
  end

  create_table "multimedia_rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "room_id"
    t.integer  "multimedia_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["multimedia_id"], name: "index_multimedia_rooms_on_multimedia_id", using: :btree
    t.index ["room_id"], name: "index_multimedia_rooms_on_room_id", using: :btree
  end

  create_table "properties_of_rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "room_id"
    t.integer  "room_property_id"
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date     "start_date"
    t.date     "finish_date"
    t.float    "proper_price",            limit: 24
    t.float    "changed_price",           limit: 24
    t.integer  "changed_count_of_person"
    t.integer  "room_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "email",                   limit: 45, null: false
    t.index ["room_id"], name: "index_reservations_on_room_id", using: :btree
  end

  create_table "room_properties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "room_id"
    t.integer  "type_of_room_id"
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "count_of_person"
    t.float    "price",           limit: 24
    t.integer  "bathroom"
    t.text     "description",     limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "type_of_rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "multimedia_hotels", "hotel_places"
  add_foreign_key "multimedia_hotels", "multimedia", column: "multimedia_id"
  add_foreign_key "multimedia_rooms", "multimedia", column: "multimedia_id"
  add_foreign_key "multimedia_rooms", "rooms"
  add_foreign_key "reservations", "rooms"
end
