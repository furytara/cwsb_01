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

ActiveRecord::Schema.define(version: 20161010092336) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "details",               null: false
    t.integer  "county_id"
    t.integer  "venue_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.index ["county_id"], name: "index_addresses_on_county_id", using: :btree
    t.index ["venue_id"], name: "index_addresses_on_venue_id", using: :btree
  end

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "password"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_admins_on_role_id", using: :btree
  end

  create_table "amenities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "booking_from",    null: false
    t.datetime "booking_to",      null: false
    t.integer  "quantity",        null: false
    t.boolean  "is_confirmed"
    t.boolean  "is_paid"
    t.integer  "user_id"
    t.integer  "space_id"
    t.integer  "booking_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["booking_type_id"], name: "index_bookings_on_booking_type_id", using: :btree
    t.index ["space_id"], name: "index_bookings_on_space_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        null: false
    t.string   "postal_code", null: false
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["country_id"], name: "index_cities_on_country_id", using: :btree
  end

  create_table "counties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_counties_on_city_id", using: :btree
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",         null: false
    t.string   "country_code", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.float    "amount",          limit: 24, null: false
    t.integer  "coupon_type",                null: false
    t.datetime "applied_date"
    t.datetime "expired_date"
    t.boolean  "active"
    t.integer  "space_id"
    t.integer  "quantity_id"
    t.integer  "booking_type_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["booking_type_id"], name: "index_coupons_on_booking_type_id", using: :btree
    t.index ["quantity_id"], name: "index_coupons_on_quantity_id", using: :btree
    t.index ["space_id"], name: "index_coupons_on_space_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image_url",      null: false
    t.string   "title"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree
    t.index ["user_id"], name: "index_images_on_user_id", using: :btree
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "amount",     limit: 24
    t.integer  "state"
    t.integer  "booking_id"
    t.integer  "coupon_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["booking_id"], name: "index_invoices_on_booking_id", using: :btree
    t.index ["coupon_id"], name: "index_invoices_on_coupon_id", using: :btree
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "notifiable_type"
    t.integer  "notifiable_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "object_type",                   null: false
    t.boolean  "create_action", default: false
    t.boolean  "read_action",   default: false
    t.boolean  "update_action", default: false
    t.boolean  "delete_action", default: false
    t.integer  "role_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["role_id"], name: "index_permissions_on_role_id", using: :btree
  end

  create_table "prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "price",           limit: 24, null: false
    t.integer  "space_id"
    t.integer  "booking_type_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["booking_type_id"], name: "index_prices_on_booking_type_id", using: :btree
    t.index ["space_id"], name: "index_prices_on_space_id", using: :btree
  end

  create_table "quantities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",    null: false
    t.integer  "rate"
    t.integer  "user_id"
    t.integer  "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
    t.index ["venue_id"], name: "index_reviews_on_venue_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "type",       null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "space_type", null: false
    t.integer  "size",       null: false
    t.integer  "capicity",   null: false
    t.integer  "quantity",   null: false
    t.integer  "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_spaces_on_venue_id", using: :btree
  end

  create_table "user_role_venues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_role_venues_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_role_venues_on_user_id", using: :btree
    t.index ["venue_id"], name: "index_user_role_venues_on_venue_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "password"
    t.string   "phone_number"
    t.boolean  "verified"
    t.boolean  "active"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "venue_amenities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "amenity_id"
    t.integer  "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_venue_amenities_on_amenity_id", using: :btree
    t.index ["venue_id"], name: "index_venue_amenities_on_venue_id", using: :btree
  end

  create_table "venues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "working_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "day_in_week",  null: false
    t.time     "working_from", null: false
    t.time     "working_to",   null: false
    t.integer  "space_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["space_id"], name: "index_working_times_on_space_id", using: :btree
  end

  add_foreign_key "addresses", "counties"
  add_foreign_key "admins", "roles"
  add_foreign_key "bookings", "booking_types"
  add_foreign_key "bookings", "spaces"
  add_foreign_key "bookings", "users"
  add_foreign_key "cities", "countries"
  add_foreign_key "counties", "cities"
  add_foreign_key "coupons", "booking_types"
  add_foreign_key "coupons", "quantities"
  add_foreign_key "coupons", "spaces"
  add_foreign_key "invoices", "bookings"
  add_foreign_key "invoices", "coupons"
  add_foreign_key "notifications", "users"
  add_foreign_key "permissions", "roles"
  add_foreign_key "prices", "booking_types"
  add_foreign_key "prices", "spaces"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "venues"
  add_foreign_key "spaces", "venues"
  add_foreign_key "user_role_venues", "roles"
  add_foreign_key "user_role_venues", "users"
  add_foreign_key "user_role_venues", "venues"
  add_foreign_key "venue_amenities", "amenities"
  add_foreign_key "venue_amenities", "venues"
  add_foreign_key "working_times", "spaces"
end
