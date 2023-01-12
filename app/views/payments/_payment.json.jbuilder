json.extract! payment, :id, :date, :file_number, :kind, :amount, :comments, :contract_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
