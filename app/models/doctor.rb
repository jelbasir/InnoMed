# frozen_string_literal: true

# == Schema Information
#
# Table name: doctors
#
#  id                     :integer          not null, primary key
#  address                :string
#  bio                    :text
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  gp_number              :string
#  image_url              :string
#  last_name              :string
#  middle_name            :string
#  phone_no               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  speciality             :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_doctors_on_email                 (email) UNIQUE
#  index_doctors_on_reset_password_token  (reset_password_token) UNIQUE
#


class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_many :schedules, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

end
