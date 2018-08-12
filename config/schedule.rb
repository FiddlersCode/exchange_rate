# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, '/var/log/cron_log.log'

@root = '/Users/paulamuldoon/'
@test_data_provider = 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'

every 1.day, at: '3:00am' do
  command "curl -o #{@root}exchange_rate/lib/exchange_rate_data/daily_rates.xml #{@test_data_provider}"
end

# Learn more: http://github.com/javan/whenever
