json.array!(@attendees) do |attendee|
  json.extract! attendee, :id, :user_id, :activity_id, :role
  json.url attendee_url(attendee, format: :json)
end
