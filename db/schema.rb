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

ActiveRecord::Schema.define(version: 2020_10_28_220826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carretes", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "user_id"
    t.integer "max_price"
    t.integer "min_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carretes_on_user_id"
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "author"
    t.text "body"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "carrete_id"
    t.bigint "user_id"
    t.index ["carrete_id"], name: "index_comentarios_on_carrete_id"
    t.index ["post_id"], name: "index_comentarios_on_post_id"
    t.index ["user_id"], name: "index_comentarios_on_user_id"
  end

  create_table "comunas", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "author"
    t.string "title"
    t.string "tipo"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postulacions", force: :cascade do |t|
    t.integer "carrete_id"
    t.text "postulaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servicecomments", force: :cascade do |t|
    t.bigint "user_id"
    t.text "body"
    t.bigint "servicio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["servicio_id"], name: "index_servicecomments_on_servicio_id"
    t.index ["user_id"], name: "index_servicecomments_on_user_id"
  end

  create_table "servicios", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.text "body"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_servicios_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "role_id"
    t.bigint "comunas_id"
    t.index ["comunas_id"], name: "index_users_on_comunas_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "carretes", "users"
  add_foreign_key "comentarios", "carretes"
  add_foreign_key "comentarios", "posts"
  add_foreign_key "comentarios", "users"
  add_foreign_key "servicecomments", "servicios"
  add_foreign_key "servicecomments", "users"
  add_foreign_key "servicios", "users"
  add_foreign_key "users", "comunas", column: "comunas_id"
  add_foreign_key "users", "roles"
end
