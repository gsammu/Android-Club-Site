desc "This task is called by the Heroku scheduler add-on"
task :send_reminder => :environment do
  puts "Updating feed..."
  User.reminder_task
  puts "done."
end