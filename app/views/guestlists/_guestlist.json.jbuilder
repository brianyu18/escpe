json.extract! guestlist, :id, :user_id, :event_id, :created_at, :updated_at
json.url guestlist_url(guestlist, format: :json)
