# == Schema Information
#
# Table name: members
#
#  id              :integer          not null, primary key
#  birthday        :date
#  email           :string
#  first_name      :string
#  last_name       :string
#  phone_number    :string
#  role            :string           default("Member")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :integer
#
class Member < ApplicationRecord
  has_many :tasks, foreign_key: "assigned_to_id", dependent: :destroy
  belongs_to :organization
end
