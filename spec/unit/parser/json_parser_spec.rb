require 'exchange_rate'

RSpec.describe ExchangeRate do
  describe 'parsing the xml' do
    before(:each) do
      @parser = JSONParser.new
    end

    it 'should respond to the necessary methods rate' do
      expect(@parser).to respond_to(:get_rate)
      expect(@parser).to respond_to(:get_counter_currencies)
      expect(@parser).to respond_to(:open_rates_file)
      expect(@parser).to respond_to(:get_current_rates_file)
    end

    it 'should get the current rates file' do
      expect(@parser.get_current_rates_file).to eq('./lib/exchange_rate_data/daily_rates.xml')
    end
  end
end
