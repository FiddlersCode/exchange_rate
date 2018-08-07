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

    describe 'invalid data' do
      it 'should throw an error if the date is not supported' do
        @exchange_rate = ExchangeRate.new(Date.new(2017,8,3), 'EUR', 'USD')
        expect{@parser.get_rate(@exchange_rate)}.to raise_error("Date must be within the past 90 days.")
      end

      it 'should throw an error if the base currency is not supported' do
        @exchange_rate = ExchangeRate.new(Date.today, 'test', 'USD')
        expect{@parser.get_rate(@exchange_rate)}.to raise_error("This base currency is not supported.")
      end

      it 'should throw an error if the counter currency is not supported' do
        @exchange_rate = ExchangeRate.new(Date.today, 'EUR', 'test')
        expect{@parser.get_rate(@exchange_rate)}.to raise_error("This counter currency is not supported.")
      end

    end
  end

end