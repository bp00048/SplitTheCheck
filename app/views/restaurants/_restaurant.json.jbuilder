json.extract! restaurant, :id, :name, :location, :website, :yes_split, :no_split, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
