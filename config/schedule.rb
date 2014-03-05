set :output, "my/cron_log.log"

every 1.day, :at => '00.00' do
  runner "Ad.Published!"
end

every 3.day, :at => '23.50' do
  runner "Ad.Archives!"
end

every 1.minutes do 
  runner "Ad.Published!"
end 


# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
