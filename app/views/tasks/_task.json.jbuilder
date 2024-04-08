json.extract! task, :id, :text, :due_date, :assigned_to_id, :status, :organization_id, :created_at, :updated_at
json.url task_url(task, format: :json)
