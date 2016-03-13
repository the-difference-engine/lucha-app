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

ActiveRecord::Schema.define(version: 20160313205141) do

  create_table "budgets", force: :cascade do |t|
    t.decimal  "gross_wages",                          precision: 8, scale: 2
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.decimal  "self_employment_income",               precision: 8, scale: 2
    t.decimal  "overtime",                             precision: 8, scale: 2
    t.decimal  "unemployment",                         precision: 8, scale: 2
    t.decimal  "tips_commisions_bonus",                precision: 8, scale: 2
    t.decimal  "nontaxable_social_security",           precision: 8, scale: 2
    t.decimal  "taxable_social_security",              precision: 8, scale: 2
    t.decimal  "rental_income",                        precision: 8, scale: 2
    t.decimal  "other_income",                         precision: 8, scale: 2
    t.decimal  "primary_checking",                     precision: 8, scale: 2
    t.decimal  "secondary_checking",                   precision: 8, scale: 2
    t.decimal  "savings_money_market",                 precision: 8, scale: 2
    t.decimal  "stocks_or_bonds",                      precision: 8, scale: 2
    t.decimal  "four_zero_one_k",                      precision: 8, scale: 2
    t.decimal  "home_equity",                          precision: 8, scale: 2
    t.decimal  "other_property",                       precision: 8, scale: 2
    t.decimal  "car",                                  precision: 8, scale: 2
    t.decimal  "other_assets",                         precision: 8, scale: 2
    t.decimal  "principal_and_interest",               precision: 8, scale: 2
    t.decimal  "prop_tax",                             precision: 8, scale: 2
    t.decimal  "assoc_fees",                           precision: 8, scale: 2
    t.decimal  "junior_mortgage",                      precision: 8, scale: 2
    t.decimal  "min_credit_card_payment",              precision: 8, scale: 2
    t.decimal  "car_payment",                          precision: 8, scale: 2
    t.decimal  "student_loan",                         precision: 8, scale: 2
    t.decimal  "gas",                                  precision: 8, scale: 2
    t.decimal  "electricity",                          precision: 8, scale: 2
    t.decimal  "water",                                precision: 8, scale: 2
    t.decimal  "phone",                                precision: 8, scale: 2
    t.decimal  "other_utilities",                      precision: 8, scale: 2
    t.decimal  "food",                                 precision: 8, scale: 2
    t.decimal  "auto_insurance",                       precision: 8, scale: 2
    t.decimal  "gas_car_maintenance",                  precision: 8, scale: 2
    t.decimal  "child_care",                           precision: 8, scale: 2
    t.decimal  "medical_expenses",                     precision: 8, scale: 2
    t.decimal  "clothing",                             precision: 8, scale: 2
    t.decimal  "rent",                                 precision: 8, scale: 2
    t.decimal  "rental_insurance",                     precision: 8, scale: 2
    t.decimal  "total_monthly_debt",                   precision: 8, scale: 2
    t.decimal  "gross_monthly_income",                 precision: 8, scale: 2
    t.decimal  "debt_divided_by_income",               precision: 8, scale: 2
    t.integer  "client_id",                  limit: 4
  end

  create_table "clients", force: :cascade do |t|
    t.string   "email",                        limit: 255,                         default: "",    null: false
    t.string   "encrypted_password",           limit: 255,                         default: "",    null: false
    t.string   "reset_password_token",         limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                limit: 4,                           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",           limit: 255
    t.string   "last_sign_in_ip",              limit: 255
    t.datetime "created_at",                                                                       null: false
    t.datetime "updated_at",                                                                       null: false
    t.string   "first_name",                   limit: 255
    t.string   "last_name",                    limit: 255
    t.string   "race",                         limit: 255
    t.string   "sex",                          limit: 255
    t.string   "home_phone",                   limit: 255
    t.string   "work_phone",                   limit: 255
    t.string   "cell_phone",                   limit: 255
    t.string   "address",                      limit: 255
    t.string   "city",                         limit: 255
    t.string   "state",                        limit: 255
    t.integer  "ward",                         limit: 4
    t.string   "zip_code",                     limit: 255
    t.string   "ssn",                          limit: 255
    t.string   "preferred_contact_method",     limit: 255
    t.string   "preferred_language",           limit: 255
    t.string   "marital_status",               limit: 255
    t.date     "dob"
    t.boolean  "head_of_household",                                                default: false, null: false
    t.integer  "num_in_household",             limit: 4
    t.integer  "num_of_dependants",            limit: 4
    t.string   "education_level",              limit: 255
    t.boolean  "disability",                                                       default: false, null: false
    t.boolean  "union_member",                                                     default: false, null: false
    t.boolean  "military_service_member",                                          default: false, null: false
    t.boolean  "volunteer_interest",                                               default: false, null: false
    t.decimal  "estimated_household_income",               precision: 9, scale: 2
    t.boolean  "authorization_and_waiver"
    t.boolean  "privacy_policy_authorization"
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "foreclosures", force: :cascade do |t|
    t.string   "currently_foreclosed",     limit: 255
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.integer  "client_id",                limit: 4
    t.string   "originating_lender",       limit: 255
    t.string   "original_loan_number",     limit: 255
    t.string   "servicer",                 limit: 255
    t.string   "servicer_loan_number",     limit: 255
    t.decimal  "monthly_mortgage_payment",             precision: 8, scale: 2
    t.integer  "loan_term",                limit: 4
    t.date     "origination_date"
    t.boolean  "been_to_court"
    t.string   "court_case_number",        limit: 255
    t.boolean  "working_with_lawyer"
    t.boolean  "working_w_agency"
    t.string   "agency",                   limit: 255
  end

  create_table "homebuyings", force: :cascade do |t|
    t.string   "lender",                     limit: 255
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "client_id",                  limit: 4
    t.string   "hear_of_workshop",           limit: 255
    t.boolean  "contact_for_appointment",                default: false
    t.boolean  "real_estate_contract",                   default: false
    t.string   "realtor_name",               limit: 255
    t.string   "realtor_phone",              limit: 255
    t.string   "property_address",           limit: 255
    t.string   "property_state",             limit: 255
    t.string   "property_city",              limit: 255
    t.string   "loan_officer_name",          limit: 255
    t.string   "loan_officer_email",         limit: 255
    t.string   "loan_officer_phone",         limit: 255
    t.string   "payment_assistance_program", limit: 255
    t.string   "approx_closing_date",        limit: 255
  end

  create_table "law_projects", force: :cascade do |t|
    t.string   "violation_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "client_id",      limit: 4
  end

  create_table "program_employees", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "programable_id",   limit: 4
    t.string   "programable_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.integer  "evictions",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "client_id",  limit: 4
  end

  create_table "senior_repairs", force: :cascade do |t|
    t.string   "contractor", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "client_id",  limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "position",               limit: 255
    t.string   "home_phone",             limit: 255
    t.string   "work_phone",             limit: 255
    t.string   "cell_phone",             limit: 255
    t.integer  "permissions",            limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
