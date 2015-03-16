desc "This task is called by the Heroku scheduler add-on"
task :send_reminder => :environment do
  puts "Sending reminders..."
  User.reminder_task
  puts "done."
end