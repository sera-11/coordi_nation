class CreateMeetingMinutes < ActiveRecord::Migration[7.0]
  def change
    create_table :meeting_minutes do |t|
      t.date :meeting_date
      t.integer :organization_id

      t.timestamps
    end
  end
end
