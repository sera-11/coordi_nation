# == Schema Information
#
# Table name: tasks
#
#  id              :integer          not null, primary key
#  due_date        :date
#  status          :string           default("not_started")
#  text            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  assigned_to_id  :integer
#  organization_id :integer
#
class Task < ApplicationRecord
  belongs_to :member, foreign_key: "assigned_to_id"
  belongs_to :organization

  enum status: { not_started: "Not started", in_progress: "In progress", completed: "Completed" }

  after_initialize :set_default_status, if: :new_record?

  validates :text, presence: true
  validates :status, presence: true
  validates :assigned_to_id, presence: true
  validates :due_date, presence: true

  private

  def set_default_status
    self.status ||= :not_started
  end
end
