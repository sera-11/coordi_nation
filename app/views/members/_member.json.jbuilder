json.extract! member, :id, :first_name, :last_name, :role, :phone_number, :email, :birthday, :organization_id, :created_at, :updated_at
json.url member_url(member, format: :json)
