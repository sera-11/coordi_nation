json.extract! meeting_minute, :id, :content, :meeting_date, :organization_id, :created_at, :updated_at
json.url meeting_minute_url(meeting_minute, format: :json)
json.content meeting_minute.content.to_s
