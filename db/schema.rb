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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180821225654) do

  create_table "architects", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "establishments", force: :cascade do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.integer  "tipo_direccion"
    t.string   "nombre_propietario"
    t.integer  "genero_propietario"
    t.string   "num_soli"
    t.integer  "aforo"
    t.string   "letras_aforo"
    t.integer  "actividad"
    t.float    "area"
    t.datetime "primera_inspeccion"
    t.datetime "segunda_inspeccion"
    t.boolean  "cumple"
    t.string   "num_recibo"
    t.string   "num_resolucion"
    t.integer  "tipo_inspeccion"
    t.integer  "riesgo"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "generate_resolution", default: false
    t.boolean  "cumple_2"
  end

  create_table "personals", force: :cascade do |t|
    t.integer  "establishment_id"
    t.integer  "architect_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "personals", ["architect_id"], name: "index_personals_on_architect_id"
  add_index "personals", ["establishment_id"], name: "index_personals_on_establishment_id"

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.string   "last_name"
    t.integer  "gender"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
