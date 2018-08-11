# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/var/log/cron_log.log"

@root = "/Users/paulamuldoon/"

every 1.day, at: '3:00am' do
  command "curl -o #{@root}exchange_rate/spec/test_data/daily_rates.xml http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml?526da90c43e51cc5b44bf360e6f1dac3"
end

# every 1.day, at: '4:30am' do
#   command "curl http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml?526da90c43e51cc5b44bf360e6f1dac3 -0 ./spec/test_data/daily_rates.xml"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
