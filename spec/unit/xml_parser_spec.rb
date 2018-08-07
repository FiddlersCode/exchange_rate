require 'exchange_rate'

RSpec.describe ExchangeRate do

  describe 'parsing the xml' do
    before(:each) do
      @parser = XMLParser.new
      @exchange_rate = ExchangeRate.new(Date.new(2018,8,3), 'EUR', 'USD')
    end

    it 'should set the xml file' do
      @parser.get_rate(@exchange_rate)
      expect(@parser.file).to eq './lib/rates/daily_rates.xml'
    end

    it 'should get the date of the first item in the row' do
      expect(@parser.get_rate(@exchange_rate)).to eq 1.1588
    end
  end

end