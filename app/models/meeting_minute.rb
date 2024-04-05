# == Schema Information
#
# Table name: meeting_minutes
#
#  id              :integer          not null, primary key
#  meeting_date    :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :integer
#
class MeetingMinute < ApplicationRecord
  has_rich_text :content

  belongs_to :organization

end
