require 'exchange_rate'

RSpec.describe ExchangeRate do
  describe 'parsing the xml' do
    before(:each) do
      @parser = JSONParser.new
    end

    it 'should get the current rates file' do
      @exchange_rate = ExchangeRate.new(Date.new(2018,8,3), 'EUR', 'USD')
      @parser.get_rate(@exchange_rate)
      expect(@parser.file).to eq './lib/exchange_rate_data/daily_rates.xml'
    end
  end
end
