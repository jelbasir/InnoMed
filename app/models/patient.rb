# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id                     :integer          not null, primary key
#  address                :text
#  age                    :integer
#  dob                    :date
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  gender                 :string
#  insurance              :string
#  last_name              :string
#  password_digest        :string
#  phoneNo                :string
#  photo                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_patients_on_email                 (email) UNIQUE
#  index_patients_on_reset_password_token  (reset_password_token) UNIQUE
#

class Patient < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  has_many :microposts, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
