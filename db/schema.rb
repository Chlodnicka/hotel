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

ActiveRecord::Schema.define(version: 20160914160733) do

  create_table "hotel_places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "street"
    t.integer  "numer"
    t.string   "city_code"
    t.string   "city"
    t.string   "phone_numbers"
    t.string   "email_addresses"
    t.text     "description",     limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["user_id"], name: "index_hotel_places_on_user_id", using: :btree
  end

  create_table "multimedia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "multimedia_hotels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "hotel_place_id"
    t.integer  "multimedia_id"
    t.string   "type_of_display"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["hotel_place_id"], name: "index_multimedia_hotels_on_hotel_place_id", using: :btree
    t.index ["multimedia_id"], name: "index_multimedia_hotels_on_multimedia_id", using: :btree
  end

  create_table "multimedia_rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "room_id"
    t.integer  "multimedia_id"
    t.string   "type_of_display"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["multimedia_id"], name: "index_multimedia_rooms_on_multimedia_id", using: :btree
    t.index ["room_id"], name: "index_multimedia_rooms_on_room_id", using: :btree
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date     "start_date"
    t.date     "finish_date"
    t.float    "proper_price",            limit: 24
    t.float    "changed_price",           limit: 24
    t.integer  "changed_count_of_person"
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["room_id"], name: "index_reservations_on_room_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_properties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_room_properties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "room_id"
    t.integer  "room_properties_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["room_id"], name: "index_room_room_properties_on_room_id", using: :btree
    t.index ["room_properties_id"], name: "index_room_room_properties_on_room_properties_id", using: :btree
  end

  create_table "room_type_of_rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "room_id"
    t.integer  "type_of_room_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["room_id"], name: "index_room_type_of_rooms_on_room_id", using: :btree
    t.index ["type_of_room_id"], name: "index_room_type_of_rooms_on_type_of_room_id", using: :btree
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "count_of_person"
    t.float    "price",           limit: 24
    t.integer  "bathroom"
    t.text     "description",     limit: 65535
    t.integer  "hotel_place_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["hotel_place_id"], name: "index_rooms_on_hotel_place_id", using: :btree
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
    t.integer  "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "hotel_places", "users"
  add_foreign_key "multimedia_hotels", "hotel_places"
  add_foreign_key "multimedia_hotels", "multimedia", column: "multimedia_id"
  add_foreign_key "multimedia_rooms", "multimedia", column: "multimedia_id"
  add_foreign_key "multimedia_rooms", "rooms"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "reservations", "users"
  add_foreign_key "room_room_properties", "room_properties", column: "room_properties_id"
  add_foreign_key "room_room_properties", "rooms"
  add_foreign_key "room_type_of_rooms", "rooms"
  add_foreign_key "room_type_of_rooms", "type_of_rooms"
  add_foreign_key "rooms", "hotel_places"
  add_foreign_key "users", "roles"
end
