json.extract! user, :id, :fname, :lname, :password, :numevents, :profile, :created_at, :updated_at
json.url user_url(user, format: :json)
