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

ActiveRecord::Schema.define(version: 20170303021041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.decimal  "gross_wages",                precision: 8, scale: 2, default: 0.0
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.decimal  "self_employment_income",     precision: 8, scale: 2, default: 0.0
    t.decimal  "overtime",                   precision: 8, scale: 2, default: 0.0
    t.decimal  "unemployment",               precision: 8, scale: 2, default: 0.0
    t.decimal  "tips_commissions_bonus",     precision: 8, scale: 2, default: 0.0
    t.decimal  "nontaxable_social_security", precision: 8, scale: 2, default: 0.0
    t.decimal  "taxable_social_security",    precision: 8, scale: 2, default: 0.0
    t.decimal  "rental_income",              precision: 8, scale: 2, default: 0.0
    t.decimal  "other_income",               precision: 8, scale: 2, default: 0.0
    t.decimal  "primary_checking",           precision: 8, scale: 2, default: 0.0
    t.decimal  "secondary_checking",         precision: 8, scale: 2, default: 0.0
    t.decimal  "savings_money_market",       precision: 8, scale: 2, default: 0.0
    t.decimal  "stocks_or_bonds",            precision: 8, scale: 2, default: 0.0
    t.decimal  "four_zero_one_k",            precision: 8, scale: 2, default: 0.0
    t.decimal  "home_equity",                precision: 8, scale: 2, default: 0.0
    t.decimal  "other_property",             precision: 8, scale: 2, default: 0.0
    t.decimal  "car",                        precision: 8, scale: 2, default: 0.0
    t.decimal  "other_assets",               precision: 8, scale: 2, default: 0.0
    t.decimal  "principal_and_interest",     precision: 8, scale: 2, default: 0.0
    t.decimal  "prop_tax",                   precision: 8, scale: 2, default: 0.0
    t.decimal  "assoc_fees",                 precision: 8, scale: 2, default: 0.0
    t.decimal  "junior_mortgage",            precision: 8, scale: 2, default: 0.0
    t.decimal  "min_credit_card_payment",    precision: 8, scale: 2, default: 0.0
    t.decimal  "car_payment",                precision: 8, scale: 2, default: 0.0
    t.decimal  "student_loan",               precision: 8, scale: 2, default: 0.0
    t.decimal  "gas",                        precision: 8, scale: 2, default: 0.0
    t.decimal  "electricity",                precision: 8, scale: 2, default: 0.0
    t.decimal  "water",                      precision: 8, scale: 2, default: 0.0
    t.decimal  "phone",                      precision: 8, scale: 2, default: 0.0
    t.decimal  "other_utilities",            precision: 8, scale: 2, default: 0.0
    t.decimal  "food",                       precision: 8, scale: 2, default: 0.0
    t.decimal  "auto_insurance",             precision: 8, scale: 2, default: 0.0
    t.decimal  "gas_car_maintenance",        precision: 8, scale: 2, default: 0.0
    t.decimal  "child_care",                 precision: 8, scale: 2, default: 0.0
    t.decimal  "medical_expenses",           precision: 8, scale: 2, default: 0.0
    t.decimal  "clothing",                   precision: 8, scale: 2, default: 0.0
    t.decimal  "rent",                       precision: 8, scale: 2, default: 0.0
    t.decimal  "rental_insurance",           precision: 8, scale: 2, default: 0.0
    t.decimal  "total_monthly_debt",         precision: 8, scale: 2, default: 0.0
    t.decimal  "gross_monthly_income",       precision: 8, scale: 2, default: 0.0
    t.decimal  "debt_divided_by_income",     precision: 8, scale: 2, default: 0.0
    t.integer  "client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "email",                        default: "",    null: false
    t.string   "encrypted_password",           default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "race"
    t.string   "sex"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "cell_phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "ward"
    t.string   "zip_code"
    t.string   "ssn"
    t.string   "preferred_contact_method"
    t.string   "preferred_language"
    t.string   "marital_status"
    t.date     "dob"
    t.boolean  "head_of_household",            default: false, null: false
    t.integer  "num_in_household"
    t.integer  "num_of_dependants"
    t.string   "education_level"
    t.boolean  "disability",                   default: false, null: false
    t.boolean  "union_member",                 default: false, null: false
    t.boolean  "military_service_member",      default: false, null: false
    t.boolean  "volunteer_interest",           default: false, null: false
    t.string   "estimated_household_income"
    t.boolean  "authorization_and_waiver"
    t.boolean  "privacy_policy_authorization"
    t.integer  "user_id"
    t.boolean  "assign"
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "controllers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "controllers", ["email"], name: "index_controllers_on_email", unique: true, using: :btree
  add_index "controllers", ["reset_password_token"], name: "index_controllers_on_reset_password_token", unique: true, using: :btree

  create_table "foreclosures", force: :cascade do |t|
    t.string   "currently_foreclosed"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "client_id"
    t.string   "originating_lender"
    t.string   "original_loan_number"
    t.string   "servicer"
    t.string   "servicer_loan_number"
    t.decimal  "monthly_mortgage_payment", precision: 8, scale: 2
    t.integer  "loan_term"
    t.date     "origination_date"
    t.boolean  "been_to_court"
    t.string   "court_case_number"
    t.boolean  "working_with_lawyer"
    t.boolean  "working_w_agency"
    t.string   "agency"
    t.string   "reason_for_default"
  end

  create_table "homebuyings", force: :cascade do |t|
    t.string   "lender"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "client_id"
    t.boolean  "contact_for_appointment",    default: false
    t.boolean  "real_estate_contract",       default: false
    t.string   "realtor_name"
    t.string   "realtor_phone"
    t.string   "property_address"
    t.string   "property_state"
    t.string   "property_city"
    t.string   "loan_officer_name"
    t.string   "loan_officer_email"
    t.string   "loan_officer_phone"
    t.string   "payment_assistance_program"
    t.string   "approx_closing_date"
    t.string   "loan_type"
  end

  create_table "law_projects", force: :cascade do |t|
    t.string   "violation_type"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "client_id"
    t.boolean  "current_evicted",       default: false
    t.boolean  "community_group",       default: false
    t.boolean  "tech_assistance",       default: false
    t.boolean  "frclsr_prevention",     default: false
    t.boolean  "low_income_family",     default: false
    t.boolean  "displacement",          default: false
    t.boolean  "substandard_housing",   default: false
    t.boolean  "disabilities",          default: false
    t.boolean  "lucha_tenant",          default: false
    t.boolean  "law_project_chargable", default: false
    t.string   "other"
    t.string   "census_tract"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "program_employees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "programable_id"
    t.string   "programable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.integer  "evictions"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.integer  "client_id"
    t.integer  "waitlist_num"
    t.boolean  "studio",                                          default: false
    t.boolean  "two_bed",                                         default: false
    t.boolean  "three_bed",                                       default: false
    t.boolean  "wheelchair_accessible"
    t.boolean  "car_owner",                                       default: false
    t.boolean  "pet_owner",                                       default: false
    t.string   "kind_of_pet"
    t.string   "hear_of_property"
    t.text     "reasons_for_application"
    t.string   "landlord_name"
    t.string   "landlord_address"
    t.string   "landlord_phone"
    t.string   "occupancy_at_apartment"
    t.decimal  "monthly_rent",            precision: 6, scale: 2
    t.decimal  "fuel_electric",           precision: 6, scale: 2
    t.string   "pre_landlord_name"
    t.string   "pre_landlord_address"
    t.string   "pre_landlord_phone"
    t.decimal  "pre_rent",                precision: 6, scale: 2
    t.decimal  "pre_fuel_electric",       precision: 6, scale: 2
    t.text     "reason_for_move"
    t.string   "housing_situation"
    t.string   "employer_name"
    t.string   "employer_address"
    t.string   "employer_city"
    t.string   "employer_state"
    t.string   "employer_phone"
    t.string   "position"
    t.integer  "length_employed"
    t.string   "personal_reference_name"
    t.string   "per_ref_address"
    t.string   "per_ref_street"
    t.string   "per_ref_state"
    t.string   "per_ref_phone"
    t.string   "per_ref_relationship"
    t.text     "displaced"
    t.text     "homeless"
    t.boolean  "over_fifty_percent",                              default: false
    t.boolean  "agree_to_fee",                                    default: false
  end

  create_table "senior_repairs", force: :cascade do |t|
    t.string   "contractor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "cell_phone"
    t.integer  "permissions"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
