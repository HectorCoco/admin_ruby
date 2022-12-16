json.extract! contract, :id, :total_amount, :total_payments, :comments, :client_id, :created_at, :updated_at
json.url contract_url(contract, format: :json)
