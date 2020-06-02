# == Schema Information
#
# Table name: nut_jobs
#
#  id              :integer          not null, primary key
#  crazy           :integer
#  email           :string
#  password        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class NutJob < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
