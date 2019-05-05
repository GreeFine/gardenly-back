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

ActiveRecord::Schema.define(version: 2019_05_04_232115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "articles", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.uuid "article_id"
  end

  create_table "garden_users", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.uuid "garden_id"
  end

  create_table "gardens", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "data"
    t.uuid "user_id"
    t.string "name"
    t.string "country"
    t.integer "items"
  end

  create_table "ground_types", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lunar_cycles", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.json "data", null: false
    t.integer "year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.integer "width"
    t.integer "height"
    t.integer "size"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.string "description"
    t.string "picture"
  end

  create_table "messages", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.uuid "user_id"
    t.uuid "room_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moderators", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["user_id"], name: "index_moderators_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
  end

  create_table "periodicities", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plant_ground_types", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.uuid "plant_id"
    t.uuid "ground_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ground_type_id"], name: "index_plant_ground_types_on_ground_type_id"
    t.index ["plant_id"], name: "index_plant_ground_types_on_plant_id"
  end

  create_table "plant_periodicities", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.uuid "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "periodicity_id"
    t.index ["periodicity_id"], name: "index_plant_periodicities_on_periodicity_id"
    t.index ["plant_id"], name: "index_plant_periodicities_on_plant_id"
  end

  create_table "plant_shapes", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.uuid "plant_id"
    t.uuid "shape_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_plant_shapes_on_plant_id"
    t.index ["shape_id"], name: "index_plant_shapes_on_shape_id"
  end

  create_table "plant_tiles", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "plant_id"
    t.uuid "tile_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.integer "blossoming_start", default: [], array: true
    t.integer "blossoming_end", default: [], array: true
    t.integer "height_low"
    t.integer "height_high"
    t.float "ph_range_low"
    t.float "ph_range_high"
    t.integer "rusticity"
    t.integer "water_need"
    t.integer "sun_need"
    t.string "color", default: [], array: true
    t.uuid "type_id"
    t.index ["type_id"], name: "index_plants_on_type_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.boolean "vote"
    t.uuid "user_id"
    t.uuid "article_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
  end

  create_table "shapes", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "users_count"
    t.integer "media_count"
    t.integer "gardens_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tech_reports", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terrains", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "tile_id"
  end

  create_table "tiles", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "garden_id"
  end

  create_table "types", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.integer "age"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "address"
    t.string "date_of_birth"
    t.string "phone_number"
    t.string "username"
    t.string "last_name"
    t.string "first_name"
    t.string "avatar"
  end

end
