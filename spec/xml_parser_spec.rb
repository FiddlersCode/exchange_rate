require 'exchange_rate'

RSpec.describe ExchangeRate do

  describe 'parsing the xml' do
    before(:each) do
      @parser = XMLParser.new
    end

    it 'should get set the xml file' do
      @parser.get_rate('2018-08-03', 'USD')
      expect(@parser.file).to eq './lib/rates/daily_rates.xml'
    end

    it 'should get the date of the first item in the row' do
      expect(@parser.get_rate('2018-08-03', 'USD')).to eq 1.1588
    end
  end

end