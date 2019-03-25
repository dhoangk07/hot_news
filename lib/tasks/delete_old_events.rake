desc 'Delete old events'
task delete_old_events: :environment do
  Event.delete_old_events_less_than_100_days_ago
end