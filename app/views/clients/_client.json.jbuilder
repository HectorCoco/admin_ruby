json.extract! client, :id, :first_name, :middle_name, :last_name, :status, :created_at, :updated_at
json.url client_url(client, format: :json)
