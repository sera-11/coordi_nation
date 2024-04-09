# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  address         :string
#  description     :text
#  end_time        :datetime
#  event_date      :date
#  hosting         :boolean
#  start_time      :datetime
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :integer
#
class Event < ApplicationRecord
  belongs_to :organization

  validates :title, presence: true
  # validates :event_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
