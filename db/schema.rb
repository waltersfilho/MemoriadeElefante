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

ActiveRecord::Schema.define(version: 20160506174037) do

  create_table "acontecimentos", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descricao"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partidos", force: :cascade do |t|
    t.string   "nome"
    t.string   "descricao"
    t.string   "sigla"
    t.integer  "numero_politicos"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "legenda"
  end

  create_table "politicos", force: :cascade do |t|
    t.string   "nome"
    t.integer  "idade"
    t.string   "estado"
    t.string   "cidade"
    t.string   "municipio"
    t.integer  "partido_id"
    t.string   "cargo_eleito"
    t.string   "cargo_atual"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "politicos", ["partido_id"], name: "index_politicos_on_partido_id"

end
