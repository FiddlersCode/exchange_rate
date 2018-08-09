require 'exchange_rate'

RSpec.describe Schedule do

  describe 'cron job' do
    it 'makes sure `runner` statements exist' do
      schedule = Whenever::Test::Schedule.new(file: 'config/schedule.rb')

      assert_equal 1, schedule.jobs[:runner].count

      # Executes the actual ruby statement to make sure all constants and methods exist:
      # schedule.jobs[:runner].each { |job| instance_eval job[:task] }
    end
  end


end

