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

ActiveRecord::Schema.define(version: 20190704224915) do

  create_table "appointments", force: :cascade do |t|
    t.date "appointmentdate"
    t.time "appointmenttime"
    t.integer "patient_id"
    t.integer "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "totalhours"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "consultations", force: :cascade do |t|
    t.string "name"
    t.text "consultation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "remoteconsultation_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "image_url"
    t.string "speciality"
    t.text "bio"
    t.string "address"
    t.string "email"
    t.string "phone_no"
    t.string "gp_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "hourlycharge", precision: 5, scale: 2
    t.integer "user_id"
    t.string "password_digest"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "photo"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "phoneNo"
    t.string "email"
    t.string "gender"
    t.text "address"
    t.string "insurance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.date "dob"
    t.integer "user_id"
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.text "prescription"
    t.decimal "prescription_cost", precision: 7, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
  end

  create_table "remoteconsultations", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.integer "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_schedules_on_doctor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email"
  end

end
