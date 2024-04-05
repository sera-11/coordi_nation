# == Schema Information
#
# Table name: tasks
#
#  id              :integer          not null, primary key
#  due_date        :date
#  status          :string           default("not started")
#  text            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  assigned_to_id  :integer
#  organization_id :integer
#
class Task < ApplicationRecord
  belongs_to :member, foreign_key: "assigned_to_id"
  belongs_to :organization

  validates :text, presence: true
  validates :status, presence: true
  validates :assigned_to_id, presence: true
  validates :due_date, presence: true
end
