json.extract! cart_item, :id, :costomer_id, :product_id, :cart_id, :number, :created_at, :updated_at
json.url cart_item_url(cart_item, format: :json)
