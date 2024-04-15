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

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :role, presence: true

  def name
    "#{first_name} #{last_name}"
  end

end
