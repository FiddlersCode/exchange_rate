require 'exchange_rate'

RSpec.describe ExchangeRate do


  describe 'parsing the xml' do
    before(:each) do
      @parser = XMLParserDev.new
    end

    it 'should set the xml file' do
      @exchange_rate = ExchangeRate.new(Date.new(2018,8,3), 'EUR', 'USD')
      @parser.get_rate(@exchange_rate)
      expect(@parser.file).to eq './spec/test_data/daily_rates.xml'
    end
  end

end