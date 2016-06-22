json.array!(@events) do |event|
  json.extract! event, :id, :title, :start_date, :interval, :action_day
  json.url event_url(event, format: :json)
end
