json.extract! batch, :id, :price, :lot, :block, :boundaries, :state, :description, :created_at, :updated_at
json.url batch_url(batch, format: :json)
