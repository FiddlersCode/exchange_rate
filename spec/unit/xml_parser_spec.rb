require 'exchange_rate'

RSpec.describe ExchangeRate do

  describe 'parsing the xml' do
    before(:each) do
      @yesterday = Date.today.prev_day
      @parser = XMLParser.new
      @exchange_rate = ExchangeRate.new(Date.new(2018, 8, 3), 'EUR', 'USD')
      @daily_rates_path = './lib/exchange_rate_data/daily_rates.xml'
    end

    it 'should set the xml file' do
      @parser.get_rate(@exchange_rate)
      expect(@parser.file).to eq @daily_rates_path
    end

    it 'should get the date of the first item in the row' do
      expect(@parser.get_rate(@exchange_rate)).to eq 1.1588
    end

    context 'invalid data' do
      it 'should throw an error if the date is not supported' do
        test_date = Date.today - 90
        @exchange_rate = ExchangeRate.new(test_date, 'EUR', 'USD')
        expect {@parser.get_rate(@exchange_rate)}.to raise_error("Date must be within the past 90 days.")
      end

      it 'should throw an error if the base currency is not supported' do
        @exchange_rate = ExchangeRate.new(@yesterday, 'test', 'USD')
        expect {@parser.get_rate(@exchange_rate)}.to raise_error("The base currency test is not supported.")
      end

      it 'should throw an error if the counter currency is not supported' do
        @exchange_rate = ExchangeRate.new(@yesterday, 'EUR', 'test')
        expect {@parser.get_rate(@exchange_rate)}.to raise_error("The counter currency test is not supported.")
      end

    end
  end

end