json.extract! user, :id, :first_name, :last_name, :email, :created_at, :password_digest, :updated_at
json.url user_url(user, format: :json)
