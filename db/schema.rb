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

ActiveRecord::Schema.define(version: 2021_04_28_164428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banques", force: :cascade do |t|
    t.string "banque_name"
    t.integer "solde"
    t.integer "decouvert_autorise"
    t.integer "restant_a_tirer"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_banques_on_user_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factures", force: :cascade do |t|
    t.string "libelle"
    t.integer "facture_montant"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_factures_on_user_id"
  end

  create_table "fournisseurs", force: :cascade do |t|
    t.string "nom_fournisseur"
    t.integer "montant_fournisseur"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fournisseurs_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "email"
    t.string "telephone"
    t.text "message"
    t.string "nom"
    t.string "prenom"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "passifs", force: :cascade do |t|
    t.integer "salaires"
    t.integer "charges"
    t.integer "loyers"
    t.integer "echeances"
    t.integer "dette_fiscale"
    t.integer "autre"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_passifs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "nom"
    t.string "prenom"
    t.string "phone"
    t.string "entreprise"
    t.string "siret"
    t.boolean "regle1"
    t.boolean "regle2"
    t.boolean "is_admin"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
